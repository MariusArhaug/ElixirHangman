defmodule GameTest do
  use ExUnit.Case

  alias Hangman.Game

  test "new_game returns structure" do
    game = Game.new_game()

    assert game.turns_left == 7
    assert game.game_state == :initializing
    assert length(game.letters) > 0
  end

  test "test lowercase letters" do
    game = Game.new_game()
    game.letters
    |> Enum.filter(fn e -> e != "\r" end)
    |> Enum.each(fn e -> assert e != String.upcase(e) end)
  end

  test "state isn't changed for :won or :lost game" do
    for state <- [:won , :lost] do
      game = Game.new_game() |> Map.put(:game_state, state)
      assert { ^game, _tally } = Game.make_move(game, "x")
    end
  end

  test "first occurence of letter is not already used" do
    game = Game.new_game()
    { game, _tally } = Game.make_move(game, "x")
    assert game.game_state != :already_used
  end

  test "second occurence of letter is not already used" do
    game = Game.new_game()
    { game, _tally } = Game.make_move(game, "x")
    assert game.game_state != :already_used

    { game, _tally } = Game.make_move(game, "x")
    assert game.game_state == :already_used
  end

  test "a good guess is recognized" do
    game = Game.new_game("wibble")
    { game, _tally } = Game.make_move(game, "w")
    assert game.game_state == :good_guess
    assert game.turns_left == 7
  end

  test "a guessed word is a won game" do
    moves = [
      {"w", :good_guess},
      {"i", :good_guess},
      {"b", :good_guess},
      {"l", :good_guess},
      {"e", :won}
    ]

    game = Game.new_game("wibble")

    Enum.reduce(moves, game, fn ({guess, state}, new_game) ->
      { new_game, _tally } = Game.make_move(new_game, guess)
      assert new_game.game_state == state
      new_game
    end)
  end

  test "bad guess is recognized" do
    game = Game.new_game("wibble")
    { game, _tally } = Game.make_move(game, "x")
    assert game.game_state == :bad_guess
    assert game.turns_left == 6
  end

  test "lost game is recognized" do
    moves = [
      {"a", :bad_guess, 6},
      {"c", :bad_guess, 5},
      {"d", :bad_guess, 4},
      {"f", :bad_guess, 3},
      {"g", :bad_guess, 2},
      {"h", :bad_guess, 1},
      {"j", :lost, 0},
    ]

    game = Game.new_game("wibble")

    Enum.reduce(moves, game, fn ({guess, state, turns_left} , game) ->
      { game, _tally } = Game.make_move(game, guess)
      assert game.game_state == state
      assert game.turns_left == turns_left
      game
    end)
  end

end
