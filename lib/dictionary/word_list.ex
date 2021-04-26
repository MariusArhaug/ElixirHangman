defmodule Dictionary.WordList do
  def random_word(word_list) do
    word_list |> Enum.random()
  end

  def start() do
    "../assets/words.txt"
    |> Path.expand(__DIR__)
    |> File.read!()
    |> String.replace("\r", "")
    |> String.split(~r/\n/, trim: true)
  end
end
