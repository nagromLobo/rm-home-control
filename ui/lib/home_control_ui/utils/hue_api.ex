defmodule HomeControlUi.Utils.HueApi do

  # TODO replace with populated environment variable
  def route(path) do
    "http://192.168.86.77" <> path
  end
end
