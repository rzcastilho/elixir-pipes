defmodule ElixirPipesTest do
  use ExUnit.Case
  doctest ElixirPipes

  test "greets the world" do
    assert ElixirPipes.hello() == :world
  end
end
