defmodule ReminderApp.Worker do
  @moduledoc """
  Background jobs scheduling and running
  """

  use GenServer
  require Logger

  @doc false
  def start_link do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  @doc false
  def init(args) do
    {:ok, args}
  end

  #
  # Client API
  #

  @doc """
  Schedule background job at given `time`.
  """
  def schedule(time, module, fun, args \\ []) do
    log_schedule(time, module, fun)
    pid = GenServer.whereis(__MODULE__)
    timediff = Timex.diff(time, Timex.now(), :milliseconds)
    Process.send_after(pid, {:execute, module, fun, args}, timediff)
  end

  defp log_schedule(time, module, fun) do
    {:ok, timestr} = Timex.format(time, "{YYYY}-{0M}-{D} {h24}:{m} UTC")
    Logger.info("Scheduling task #{to_string(module)}.#{to_string(fun)} at #{timestr}")
  end

  #
  # Server API
  #

  @doc false
  def handle_info({:execute, module, fun, args}, state) do
    Logger.info("Executing task: #{module}.#{to_string(fun)}")
    #apply(module, fun, args)
    #{:ok, _pid} = spawn_link(module, fun, args)
    {:ok, _pid} = Task.start(module, fun, args)
    {:noreply, state}
  end
end
