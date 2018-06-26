defmodule ReminderApp.WorkerTest do
  use ExUnit.Case

  alias ReminderApp.Worker

  defmodule TestModule do
    def setup(pid, msg) do
      send pid, msg
    end

    def work(pid) do
      send pid, msg: "job done"
    end
  end

  setup do
    {:ok, worker_pid} = Worker.start_link(TestModule, :setup, [self(), :hello])
    {:ok, worker: worker_pid}
  end

  test "init/1 calls given module function with args" do
    assert_received :hello
  end

  test "schedule(time, module, fun, args) schedules and runs job" do
    in_50_millis = Timex.now |> Timex.shift(milliseconds: 50)

    Worker.schedule(in_50_millis, TestModule, :work, [self()])

    assert_receive msg: "job done"
  end
end
