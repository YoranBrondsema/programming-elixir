defmodule Stack.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    { :ok, _pid } = Stack.Supervisor.start_link(["cat", 5, 1])
    # # List all child processes to be supervised
    # children = [
    #   # Starts a worker by calling: Stack.Worker.start_link(arg)
    #   # {Stack.Worker, arg},
    # ]
    #
    # # See https://hexdocs.pm/elixir/Supervisor.html
    # # for other strategies and supported options
    # opts = [strategy: :one_for_one, name: Stack.Supervisor]
    # Supervisor.start_link(children, opts)
  end
end
