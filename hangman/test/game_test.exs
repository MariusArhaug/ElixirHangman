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
      assert { ^game, _} = Game.make_move(game, "x")
    end
  end
end
