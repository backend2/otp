defmodule ExwrapTest do
  use ExUnit.Case
  doctest Exwrap

  test "greets the world" do
    assert Exwrap.hello() == :world
  end
end
