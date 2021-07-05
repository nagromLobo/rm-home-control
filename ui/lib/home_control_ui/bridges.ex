defmodule HomeControlUi.Bridges do
  alias HomeControlUi.Bridges.HueRemote
  alias HomeControlUi.Bridges.Store
  alias HomeControlUi.Bridges.Bridge

  @moduledoc """
  Service functions to manage bridge state,
  """

  @spec try_connect_hue_bridge() :: HueRemote.bridge_connect_response_t()

  @doc """
  Trys to connect to a new hue bridge, replacing the singleton
  hue bridge state if successful. Requires a human to press the syncing
  button on the hue bridge to work
  """
  def try_connect_hue_bridge() do
    with {:ok, %{token: token}} <- HueRemote.create_new_bridge_connection(),
         {:ok, bridge} <-
           Store.put_hue_bridge(%Bridge{token: token, type: :hue, created_at: DateTime.utc_now()}) do
      {:ok, bridge}
    end
  end

  @spec get_hue_bridge() :: Bridge.t() | nil

  @doc """
  Returns the singleton hue bridge, or nil if not set
  """
  def get_hue_bridge() do
    Store.get_hue_bridge()
  end
end
