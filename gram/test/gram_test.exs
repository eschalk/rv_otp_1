defmodule GramTest do
  use ExUnit.Case
  doctest Gram

  test "greets the world" do
    assert Gram.hello() == :world
  end
end
