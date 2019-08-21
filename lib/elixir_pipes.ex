defmodule ElixirPipes do
  def pipe do
    File.read!("beers.csv")
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn line -> String.split(line, ",") end)
    |> Enum.filter(fn values -> Enum.count(values) == 2 end)
    |> Enum.map(fn [id, _] -> HTTPoison.get!("https://api.punkapi.com/v2/beers/#{id}") end)
    |> Enum.filter(fn %{status_code: status_code} -> status_code == 200 end)
    |> Enum.map(fn %{body: body} -> Jason.decode!(body, keys: :atoms) end)
    |> Enum.map(fn [%{id: id, name: name, abv: abv}] -> %{id: id, name: name, abv: abv} end)
  end
end
