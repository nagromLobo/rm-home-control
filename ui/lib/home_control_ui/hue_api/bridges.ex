defmodule HomeControlUi.HueAPI.Bridges do
  require Logger
  import HTTPoison
  alias HTTPoison.Response
  alias HomeControlUi.HueApi.Utils

  @user_base_path "/api/"

  defp extract_bridge_connection_token(body) do
    case Utils.parse_mutation_response(body) do
      {:full, %{success: [%{"username" => token} | _rest]}} ->
        {:ok, token}

      {_, %{errors: errors}} ->
        {:error,
         %{
           type: :hue,
           errors: errors
         }}
    end
  end

  def new_connection() do
    case post(
           Utils.route(@user_base_path),
           Jason.encode!(%{devicetype: "home_control_ui#Home Control Bridge"})
         ) do
      {:ok, %Response{status_code: 200, body: body}} ->
        extract_bridge_connection_token(body)
    end
  end
end
