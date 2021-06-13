defmodule HomeControlUiWeb.LightView do
  use HomeControlUiWeb, :view
  alias HomeControlUiWeb.LightView
  alias HomeControlUi.Devices.Light

  @spec render(String.t(), %{light: Light.t()} | %{lights: [Light.t()]}) :: any()

  def render("index.json", %{lights: lights}) do
    %{data: render_many(lights, LightView, "light.json")}
  end

  def render("show.json", %{light: light}) do
    %{data: render_one(light, LightView, "light.json")}
  end

  def render("light.json", %{light: light}) do
    %{id: light.id,
      name: light.name,
      is_on: light.is_on,
      provider: light.provider}
  end
end
