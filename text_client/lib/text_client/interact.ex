defmodule TextClient.Interact do

  alias TextClient.{State, Player}

  def start() do
    Hangman.init_game()
    |> setup_state()
    |> Player.play()
  end

  def play(state) do
    # Interact
    # Recursion
    play(state)
  end

  defp setup_state(game) do
    %State{
      game_service: game,
      tally: Hangman.tally(game)
    }
  end

end
