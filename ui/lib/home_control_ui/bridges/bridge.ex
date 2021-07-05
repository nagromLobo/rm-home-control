defmodule HomeControlUi.Bridges.Bridge do
  @moduledoc """
  Representation of a bridge used for communicating with IOT devices
  """
  use TypedStruct

  typedstruct enforce: true do
    field :token, String.t()
    field :type, atom()
    field :created_at, integer()
  end
end
