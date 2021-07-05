defmodule HomeControlUi.Settings.Bridges do
  @moduledoc """
  Service functions to manage bridge state,
  """

  @doc """
  Function to get a key to store value in the current module
  """
  def key(k) do
    {__MODULE__, k}
  end

  @spec get_hue_bridge() :: HomeControlUi.Settings.Bridge | nil

  def get_hue_bridge() do
    CubDB.get(HomeControlUi.KvStore, key(:hue_bridge))
  end

  @spec put_hue_bridge(HomeControlUi.Settings.Bridge | nil) :: :ok

  def put_hue_bridge(bridge) do
    CubDB.put(HomeControlUi.KvStore, key(:hue_bridge), bridge)
  end

  @doc """
  Trys to connect to a new hue bridge, replacing the singleton
  hue bridge state if successful. Requires a human to press the syncing
  button on the hue bridge to work
  """
  def try_connect_hue_bridge() do
    nil
  end

end
