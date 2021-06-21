defmodule HomeControlUiWeb.LightController do
  use HomeControlUiWeb, :controller

  alias HomeControlUi.Devices.Lights
  alias HomeControlUi.Devices.Light

  action_fallback HomeControlUiWeb.FallbackController

  def index(conn, _params) do
    lights = Lights.list_lights()
    render(conn, "index.json", lights: lights)
  end

  def create(conn, %{"light" => light_params}) do
    with {:ok, %Light{} = light} <- Lights.create_light(light_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.light_path(conn, :show, light))
      |> render("show.json", light: light)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Light{} = light} <- Lights.get_light(id) do
      render(conn, "show.json", light: light)
    end
  end

  def update(conn, %{"id" => id, "light" => light_params}) do
    with {:ok, %Light{} = light} <- Lights.get_light(id),
         {:ok, %Light{} = updated} <- Lights.update_light(light, light_params) do
      render(conn, "show.json", light: updated)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %Light{} = light} <- Lights.get_light(id),
         {:ok, %Light{}} <- Lights.delete_light(light) do
      send_resp(conn, :no_content, "")
    end
  end
end
