defmodule HomeControlUi.Devices.Light do
  @moduledoc """
  Generic representation of a light from multiple possible provider
  """
  use TypedStruct

  typedstruct enforce: true do
    field :id, String.t()
    field :name, String.t()
    field :is_on, boolean()
    field :provider, String.t()
  end
end
