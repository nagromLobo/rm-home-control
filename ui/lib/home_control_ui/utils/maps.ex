defmodule HomeControlUi.Utils.Maps do
  def atomize_keys(map) when is_map(map),
    do: Map.new(Enum.map(map, fn {k, v} -> {String.to_atom(k), atomize_keys(v)} end))

  def atomize_keys(v), do: v
end
