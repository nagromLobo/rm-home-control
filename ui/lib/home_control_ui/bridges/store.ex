defmodule HomeControlUi.Bridges.Store do
  alias HomeControlUi.Bridges.Bridge
  alias HomeControlUi.KvStore
  @doc """
  Function to get a key to store value in the current module
  """
  def key(k) do
    {__MODULE__, k}
  end

  @spec get_hue_bridge() :: Bridge.t() | nil

  def get_hue_bridge() do
    CubDB.get(KvStore, key(:hue_bridge))
  end

  @spec put_hue_bridge(Bridge.t() | nil) :: {:ok, Bridge.t() | nil}

  def put_hue_bridge(bridge) do
    status = CubDB.put(KvStore, key(:hue_bridge), bridge)
    {status, bridge}
  end
end
