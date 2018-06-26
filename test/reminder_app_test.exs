defmodule ReminderAppTest do
  use ExUnit.Case

  test "remind/0" do
    assert :ok == ReminderApp.remind()
  end
end
