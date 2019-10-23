# Elixir Pipes

Shows how to use pipes in Elixir.

[Elixir Pipes - medium.com](https://medium.com/@rodrigo.zampieri/elixir-pipes-fa274992738e)

### Running

```
$ git clone https://github.com/rzcastilho/elixir-pipes
$ cd elixir-pipes
$ mix deps.get
$ iex -S mix
iex(1)> ElixirPipes.beer_process
[
  %{abv: 4.5, id: 1, name: "Buzz"},
  %{abv: 4.1, id: 2, name: "Trashy Blonde"},
  %{abv: 4.2, id: 3, name: "Berliner Weisse With Yuzu - B-Sides"},
  %{abv: 6.3, id: 4, name: "Pilsen Lager"},
  %{abv: 7.2, id: 5, name: "Avery Brown Dredge"},
  %{abv: 5.2, id: 6, name: "Electric India"},
  %{abv: 11.2, id: 7, name: "AB:12"},
  %{abv: 4.7, id: 8, name: "Fake Lager"},
  %{abv: 12.5, id: 9, name: "AB:07"},
  %{abv: 7.5, id: 10, name: "Bramling X"}
]
```
