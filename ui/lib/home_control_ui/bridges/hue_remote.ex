defmodule HomeControlUi.Bridges.HueRemote do
  require Logger
  import HTTPoison
  alias HTTPoison.Response

  @user_base_path "/api/"

  @type bridge_connect_response_t ::
          {:ok, Bridge.t()} | {:error, %{type: atom(), message: String.t(), data: any()}}

  @spec create_new_bridge_connection() :: bridge_connect_response_t()

  def create_new_bridge_connection() do
    case post(@user_base_path, %{devicetype: "home_control_ui#Home Control Bridge"}) do
      {:ok, %Response{body: %{success: %{username: token}}}} ->
        {:ok, %{token: token}}

      {:ok, %Response{body: %{error: error}}} ->
        {:error, %{type: :hue, message: error['description'], data: error}}

      {:error, error} ->
        {:error, %{type: :connection, message: "Something went wrong", data: error}}

      response ->
        Logger.error(
          "Unknown response shape lead to error when connecting to new bridge",
          response
        )

        {:error, %{type: :unknown, mesage: "Someting went wrong", data: response}}
    end
  end
end
