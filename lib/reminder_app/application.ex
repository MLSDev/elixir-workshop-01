defmodule ReminderApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec
    children = [
      worker(ReminderApp.Worker, [])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ReminderApp.Supervisor]
    {:ok, pid} = Supervisor.start_link(children, opts)

    ReminderApp.schedule()

    {:ok, pid}
  end
end
