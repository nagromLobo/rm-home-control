defmodule HomeControlNervesTest do
  use ExUnit.Case
  doctest HomeControlNerves

  test "greets the world" do
    assert HomeControlNerves.hello() == :world
  end
end
