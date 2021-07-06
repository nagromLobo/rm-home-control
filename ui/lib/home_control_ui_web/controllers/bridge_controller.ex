defmodule HomeControlUiWeb.BridgeController do
  use HomeControlUiWeb, :controller
  alias HomeControlUi.Config.Bridges
  alias HomeControlUi.Config.Bridge

  action_fallback(HomeControlUiWeb.FallbackController)

  def index(conn, _params) do
    with {:ok, bridge} <- Bridges.get_hue_bridge() do
      render(conn, "index.json", bridges: if(bridge, do: [bridge], else: []))
    end
  end

  def show(conn, %{"id" => _id}) do
    case Bridges.get_hue_bridge() do
      {:ok, %Bridge{id: _id} = bridge} ->
        render(conn, "show.json", bridge: bridge)

      {:ok, nil} ->
        send_resp(conn, :not_found, "Hue bridge not found")
    end
  end

  def sync_hue(conn, _params) do
    with {:ok, %Bridge{} = bridge} <- Bridges.try_connect_hue_bridge() do
      conn
      |> put_resp_header("location", Routes.bridge_path(conn, :show, bridge.id))
      |> render("show.json", bridge: bridge)
    end
  end
end
