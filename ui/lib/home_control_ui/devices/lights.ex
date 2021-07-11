defmodule HomeControlUi.Devices.Lights do
  alias HomeControlUi.Devices.Light
  alias HomeControlUi.Config.Bridges
  alias HomeControlUi.HueApi.Lights, as: HueLights

  @moduledoc """
  Service functions to manage light state
  """

  @mock_light %Light{
    id: "hue-123",
    internal_id: "123",
    name: "test light",
    is_on: true,
    provider: :hue
  }

  defp from_hue_light(hue_light) do
    %Light{
      id: "hue-" <> hue_light.id,
      internal_id: hue_light.id,
      name: hue_light.name,
      is_on: hue_light.state.on,
      provider: :hue
    }
  end

  @spec list_lights() :: [Light.t()]
  def list_lights() do
    Enum.map(HueLights.list(Bridges.get_hue_token()), &from_hue_light/1)
  end

  @spec get_light(String.t()) :: {:ok, Light.t()}
  def get_light(id) do
    # TODO optimize to single light call
    {:ok, Enum.find(list_lights(), fn %Light{id: lightId} -> id === lightId end)}
  end

  @spec create_light(%{}) :: {:ok, Light.t()}
  def create_light(_attrs \\ %{}) do
    # create light from phillips hue
    {:ok, @mock_light}
  end

  @spec update_light(Light.t(), %{}) :: {:ok, Light.t()}
  def update_light(%Light{} = light, updates) do
    # TODO support partial updates and more generic field updates
    case light.provider do
      :hue ->
        case HueLights.patch_state(Bridges.get_hue_token(), light.internal_id, %{
               on: updates.is_on
             }) do
          {:full, _} -> {:ok, Map.put(light, :is_on, updates.is_on)}
        end
    end
  end

  @spec delete_light(Light.t()) :: {:ok, Light.t()}
  def delete_light(%Light{} = _light) do
    # delete phillips hue light
    {:ok, @mock_light}
  end
end
