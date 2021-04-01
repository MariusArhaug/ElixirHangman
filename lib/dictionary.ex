defmodule Dictionary do

  def random_word() do
    word_list()
    |> Enum.random()
  end

  def word_list do
    Path.expand("./lib/assets/words.txt")
    |> Path.absname
    |> File.read!()
    |> String.split(~r/\n/)
  end
end
