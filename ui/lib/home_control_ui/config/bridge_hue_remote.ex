defmodule HomeControlUi.Config.BridgeHueRemote do
  require Logger
  import HTTPoison
  alias HTTPoison.Response
  alias HomeControlUi.Utils.HueApi

  @user_base_path "/api/"

  @type bridge_connect_response_t ::
          {:ok, Bridge.t()} | {:error, %{type: atom(), message: String.t(), data: any()}}

  @spec create_new_bridge_connection() :: bridge_connect_response_t()

  defp extract_bridge_connection_token(body) do
    case Jason.decode(body) do
      {:ok, [%{"success" => %{"username" => token}} | _rest]} ->
        {:ok, token}

      {:ok, [%{"error" => error} | _rest]} ->
        {:error, %{type: :hue, message: Map.get(error, "description", "There wal an error connecting to hue bridge"), data: error}}

      response ->
        Logger.error("Problem parsing response #{inspect(response)}")

        {:error, %{type: :unknown, message: "Something went wrong", data: response}}
    end
  end

  def create_new_bridge_connection() do
    case post(
           HueApi.route(@user_base_path),
           Jason.encode!(%{devicetype: "home_control_ui#Home Control Bridge"})
         ) do
      {:ok, %Response{status_code: 200, body: body}} ->
        extract_bridge_connection_token(body)

      response ->
        Logger.error(
          "Bad response lead to error when connecting to new bridge: #{inspect(response)}"
        )

        {:error, %{type: :unknown, mesage: "Someting went wrong", data: response}}
    end
  end
end
