defmodule HomeControlUi.Config.Bridges do
  alias HomeControlUi.Config.BridgeHueRemote
  alias HomeControlUi.Config.BridgeStore
  alias HomeControlUi.Config.Bridge

  @moduledoc """
  Service functions to manage bridge state,
  """

  @spec try_connect_hue_bridge() :: BridgeHueRemote.bridge_connect_response_t()

  @doc """
  Trys to connect to a new hue bridge, replacing the singleton
  hue bridge state if successful. Requires a human to press the syncing
  button on the hue bridge to work
  """
  def try_connect_hue_bridge() do
    with {:ok, token} <- BridgeHueRemote.create_new_bridge_connection() do
      BridgeStore.put_hue_bridge(%Bridge{
        id: UUID.uuid4(),
        token: token,
        created_at: DateTime.utc_now()
      })
    end
  end

  @spec get_hue_bridge() :: Bridge.t() | nil

  @doc """
  Returns the singleton hue bridge, or nil if not set
  """
  def get_hue_bridge() do
    {:ok, BridgeStore.get_hue_bridge()}
  end
end
