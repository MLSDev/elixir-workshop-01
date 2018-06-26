defmodule ReminderAppTest do
  use ExUnit.Case
  doctest ReminderApp

  test "greets the world" do
    assert ReminderApp.hello() == :world
  end
end
