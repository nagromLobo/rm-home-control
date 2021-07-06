defmodule HomeControlUiWeb.Router do
  use HomeControlUiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :browser do
    plug :accepts, ["html"]
  end

  scope "/api", HomeControlUiWeb do
    pipe_through :api
    resources "/lights", LightController, except: [:new, :edit]
    resources "/hue-bridges", BridgeController, only: [:index, :show]
    post "/hue-bridges/sync", BridgeController, :sync_hue
  end

  # entry points
  scope "/", HomeControlUiWeb do
    pipe_through :browser
    get "/", PageController, :index
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: HomeControlUiWeb.Telemetry
    end
  end
end
