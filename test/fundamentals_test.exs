defmodule FundamentalsTest do
  use ExUnit.Case
  doctest Fundamentals

  test "greets the world" do
    assert Fundamentals.hello() == :world
  end
end
