defmodule HomeControlUiWeb.RootController do
  use HomeControlUiWeb, :controller

  def index(conn, params) do
    text conn, "meow #{params["meow"]}"
  end
end
