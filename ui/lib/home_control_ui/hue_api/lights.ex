defmodule HomeControlUi.HueApi.Lights do
  alias HTTPoison.Response
  alias HomeControlUi.HueApi.Utils

  def route(token, id) do
    Utils.route(token, "/lights/" <> id)
  end

  def route(token) do
    route(token, "")
  end

  def state_route(token, id) do
    route(token, id) <> "/state/"
  end

  @doc """
  List all lights
  See https://developers.meethue.com/develop/hue-api/lights-api/#get-all-lights for shape of a light
  from this api
  """
  def list(token) do
    with %Response{status_code: 200, body: body} <- HTTPoison.get!(route(token)) do
      Utils.parse_list_response(body)
    end
  end

  @doc """
  Updates light state
  See https://developers.meethue.com/develop/hue-api/lights-api/#set-light-state
  for updateable fields
  """
  def patch_state(token, id, body) do
    with %Response{status_code: 200, body: resp} <-
           HTTPoison.put!(state_route(token, id), Jason.encode!(body)) do
      Utils.parse_mutation_response(resp)
    end
  end
end
