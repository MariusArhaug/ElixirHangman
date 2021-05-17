defmodule Procs do
  def greeter(count) do
    receive do
      {:boom, reason} ->
        exit(reason)

      {:add, number} ->
        greeter(count + number)

      {:reset} ->
        greeter(0)

      msg ->
        IO.puts("#{count}: Hello #{msg}")
        greeter(count + 2)
    end
  end
end
