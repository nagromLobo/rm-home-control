defmodule HomeControlUi.HueApi.Utils do
  alias HomeControlUi.Utils.Maps

  # TODO replace with populated environment variable
  def route(path) do
    "http://192.168.86.77" <> path
  end

  def route(token, path) do
    route("/api/" <> token <> path)
  end

  defp has_success(m) do
    Map.has_key?(m, "success")
  end

  def success_state(body) do
    cond do
      Enum.all?(body, &has_success/1) ->
        :full

      Enum.any?(body, &has_success/1) ->
        :partial

      :else ->
        :error
    end
  end

  defp pluck_errors(body) do
    body
    |> Enum.map(&Map.get(&1, "error"))
    |> Enum.filter(& &1)
  end

  defp pluck_success(body) do
    body
    |> Enum.map(&Map.get(&1, "success"))
    |> Enum.filter(& &1)
  end

  def parse_mutation_response(body) when is_bitstring(body) do
    case Jason.decode!(body) do
      decoded when is_bitstring(decoded) -> parse_mutation_response(%{strval: decoded})
      decoded -> parse_mutation_response(decoded)
    end
  end

  def parse_mutation_response(body) do
    {success_state(body), %{errors: pluck_errors(body), success: pluck_success(body)}}
  end

  def parse_list_response(body) when is_bitstring(body) do
    case Jason.decode!(body) do
      decoded when is_bitstring(decoded) -> parse_list_response(%{strval: decoded})
      decoded -> parse_list_response(decoded)
    end
  end

  def parse_list_response(body) do
    # IO.puts("meow body: " <> )
    Enum.map(body, fn {id, item} -> item |> Maps.atomize_keys |> Map.put(:id, id) end)
  end
end
