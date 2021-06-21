defmodule HomeControlUiWeb.PageController do
  use HomeControlUiWeb, :controller
  def index(conn, _params) do
    file = File.read!("priv/static/dist/index.html")
    html(conn, file)
  end
end
