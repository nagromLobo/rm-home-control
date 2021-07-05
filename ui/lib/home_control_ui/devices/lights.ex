defmodule HomeControlUi.Devices.Lights do
   @moduledoc """
  Service functions to manage light state
  """

  @doc """
  Returns the list of lights.

  ## Examples

      iex> list_lights()
      [%Light{}, ...]

  """
  alias HomeControlUi.Devices.Light

  @mock_light %Light{id: "123", name: "test light", is_on: true, provider: "hue"}

  @spec list_lights() :: [Light.t()]
  def list_lights() do
    [@mock_light]
    ## get lights from phillips hue
  end


  @spec get_light(String.t()) :: {:ok, Light.t()}
  def get_light(_id) do
    # get phillips hue lights
    {:ok, @mock_light}
  end


  @spec create_light(%{}) :: {:ok, Light.t()}
  def create_light(_attrs \\ %{}) do
    # create light from phillips hue
    {:ok, @mock_light}
  end


  @spec update_light(Light.t(), %{}) :: {:ok, Light.t()}
  def update_light(%Light{} = _light, _attrs) do
    # update a phillips hue light
    {:ok, @mock_light}
  end

  @spec delete_light(Light.t()) :: {:ok, Light.t()}
  def delete_light(%Light{} = _light) do
    # delete phillips hue light
    {:ok, @mock_light}
  end
end
