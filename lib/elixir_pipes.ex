defmodule ElixirPipes do
  def pipe do
    File.read!("beers.csv")
    |> String.trim()
    |> String.split("\n")
  end
end
