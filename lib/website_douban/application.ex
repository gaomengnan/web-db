defmodule WebsiteDouban.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      WebsiteDoubanWeb.Telemetry,
      WebsiteDouban.Repo,
      {DNSCluster, query: Application.get_env(:website_douban, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: WebsiteDouban.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: WebsiteDouban.Finch},
      # Start a worker by calling: WebsiteDouban.Worker.start_link(arg)
      # {WebsiteDouban.Worker, arg},
      # Start to serve requests, typically the last entry
      WebsiteDoubanWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: WebsiteDouban.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    WebsiteDoubanWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
