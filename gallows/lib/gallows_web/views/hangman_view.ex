defmodule GallowsWeb.HangmanView do
  use GallowsWeb, :view
  def join_letters(letters), do: letters |> Enum.join(" ")
end
