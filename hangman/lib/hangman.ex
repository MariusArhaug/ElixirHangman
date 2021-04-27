defmodule Hangman do
  alias Hangman.Game

  defdelegate init_game(),  to: Game, as: :new_game
  defdelegate tally(game),  to: Game

  defdelegate make_move(game, guess), to: Game

end
