defmodule HomeControlUiWeb.Plugs.RequireHueBridge do
  import Plug.Conn
  alias HomeControlUi.Config.Bridges

  def init(opts) do
    opts
  end

  def call(%Plug.Conn{} = conn, _opts) do
    if !Bridges.get_hue_token() do
      conn
      |> send_resp(
        400,
        Jason.encode!(%{message: "Hue bridge needs to be configured to access that route"})
      )
      |> halt
    else
      conn
    end
  end

  def call(conn, default) do
    assign(conn, :locale, default)
  end
end
