defmodule HomeControlUi.Config.Bridge do
  @moduledoc """
  Representation of a bridge used for communicating with IOT devices
  """
  use TypedStruct

  typedstruct enforce: true do
    field :id, UUID.t()
    field :token, String.t()
    field :created_at, integer()
  end
end
