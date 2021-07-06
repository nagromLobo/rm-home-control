defmodule HomeControlUiWeb.BridgeView do
  use HomeControlUiWeb, :view
  alias HomeControlUiWeb.BridgeView
  alias HomeControlUi.Devices.Bridge

  @spec render(String.t(), %{bridge: Bridge.t()} | %{bridges: [Bridge.t()]}) :: any()

  def render("index.json", %{bridges: bridges}) do
    %{data: render_many(bridges, BridgeView, "bridge.json")}
  end

  def render("show.json", %{bridge: bridge}) do
    %{data: render_one(bridge, BridgeView, "bridge.json")}
  end

  def render("bridge.json", %{bridge: bridge}) do
    %{id: bridge.id, token: bridge.token, created_at: bridge.created_at}
  end
end
