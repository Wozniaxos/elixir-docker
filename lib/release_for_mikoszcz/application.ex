defmodule ReleaseForMikoszcz.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ReleaseForMikoszczWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ReleaseForMikoszcz.PubSub},
      # Start the Endpoint (http/https)
      ReleaseForMikoszczWeb.Endpoint
      # Start a worker by calling: ReleaseForMikoszcz.Worker.start_link(arg)
      # {ReleaseForMikoszcz.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ReleaseForMikoszcz.Supervisor]
    Logger.info("Mikoszcz no i ce ze zes se ustawil '#{Application.get_env(:release_for_mikoszcz, :miko_env)}' lepiej mi zalicz")

    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ReleaseForMikoszczWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
