defmodule HomeControlUiWeb.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use HomeControlUiWeb, :controller

  # This clause is an example of how to handle resources that cannot be found.
  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(HomeControlUiWeb.ErrorView)
    |> render(:"404")
  end

  def call(conn, {:error, %{type: :hue, message: message}}) do
    conn
    |> put_status(:internal_server_error)
    |> put_view(HomeControlUiWeb.ErrorView)
    |> render("hue_error.json", %{message: message})
  end
end
