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

end
