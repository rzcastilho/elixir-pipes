defmodule ElixirPipes do

  def no_pipe do
    Enum.map(String.split(String.upcase("Elixir: Pipe Operator")), fn word -> String.replace(word, ~r/[^A-Za-z0-9]/, "") end)
  end

  def pipe do
    "Elixir: Pipe Operator"
    |> String.upcase()
    |> String.split()
    |> Enum.map(fn word -> String.replace(word, ~r/[^A-Za-z0-9]/, "") end)
  end

  def valid_line([_, _]), do: true
  def valid_line(_), do: false

  def call_api([id, _]) do
    HTTPoison.get!("https://api.punkapi.com/v2/beers/#{id}")
  end

  def filter_success(%{status_code: 200}), do: true
  def filter_success(_), do: false

  def beer_process do
    File.read!("beers.csv")
    |> String.split("\n")
    |> Enum.map(fn line -> String.split(line, ",") end)
    |> Enum.filter(&valid_line/1)
    |> Enum.map(&call_api/1)
    |> Enum.filter(&filter_success/1)
    |> Enum.map(fn %{body: body} -> Jason.decode!(body, keys: :atoms) end)
    |> Enum.map(fn [%{id: id, name: name, abv: abv}] -> %{id: id, name: name, abv: abv} end)
  end

end
