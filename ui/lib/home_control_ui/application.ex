defmodule HomeControlUi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      HomeControlUiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: HomeControlUi.PubSub},
      # Start the Endpoint (http/https)
      HomeControlUiWeb.Endpoint
      # Start a worker by calling: HomeControlUi.Worker.start_link(arg)
      # {HomeControlUi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HomeControlUi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    HomeControlUiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
