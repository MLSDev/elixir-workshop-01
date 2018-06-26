defmodule ReminderApp.WorkerTest do
  use ExUnit.Case, async: true

  alias ReminderApp.Worker

  defmodule TestModule do
    def work(pid) do
      send pid, msg: "job done"
    end
  end

  test "schedule(time, module, fun, args) schedules and runs job" do
    in_50_millis = Timex.now |> Timex.shift(milliseconds: 50)

    Worker.schedule(in_50_millis, TestModule, :work, [self()])

    assert_receive msg: "job done"
  end
end
