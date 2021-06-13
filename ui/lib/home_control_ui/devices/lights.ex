defmodule HomeControlUi.Devices.Lights do
  @moduledoc """
  The Devices context.
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
  @doc """
  Gets a single light.

  Raises `Ecto.NoResultsError` if the Light does not exist.

  ## Examples

      iex> get_light!(123)
      %Light{}

      iex> get_light!(456)
      ** (Ecto.NoResultsError)

  """
  def get_light(_id) do
    # get phillips hue lights
    {:ok, @mock_light}
  end


  @spec create_light(%{}) :: {:ok, Light.t()}
  @doc """
  Creates a light.

  ## Examples

      iex> create_light(%{field: value})
      {:ok, %Light{}}

      iex> create_light(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_light(_attrs \\ %{}) do
    # create light from phillips hue
    {:ok, @mock_light}
  end


  @spec update_light(Light.t(), %{}) :: {:ok, Light.t()}
  @doc """
  Updates a light.

  ## Examples

      iex> update_light(light, %{field: new_value})
      {:ok, %Light{}}

      iex> update_light(light, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_light(%Light{} = _light, _attrs) do
    # update a phillips hue light
    {:ok, @mock_light}
  end

  @spec delete_light(Light.t()) :: {:ok, Light.t()}
  @doc """
  Deletes a light.

  ## Examples

      iex> delete_light(light)
      {:ok, %Light{}}

      iex> delete_light(light)
      {:error, %Ecto.Changeset{}}

  """
  def delete_light(%Light{} = _light) do
    # delete phillips hue light
    {:ok, @mock_light}
  end
end
