defmodule ReminderApp.WorkdaysTest do
  use ExUnit.Case

  alias ReminderApp.Workdays

  describe "is_workday/1" do
    test "Tue Jun 26 2018 is a workday" do
      {:ok, date} = Date.new(2018, 6, 26)
      assert Workdays.is_workday(date)
    end

    test "Sat Jun 30 2018 is not a workday" do
      {:ok, date} = Date.new(2018, 6, 30)
      refute Workdays.is_workday(date)
    end
  end

  describe "last_workday/1" do
    test "Fri, Jun 29, 2018" do
      {:ok, date} = Date.new(2018, 6, 1)
      assert ~D[2018-06-29] == Workdays.last_workday(date)
    end

    test "Tue, Jul 31, 2018" do
      {:ok, date} = Date.new(2018, 7, 1)
      assert ~D[2018-07-31] == Workdays.last_workday(date)
    end
  end

  describe "next_last_workday/1" do
    test "Mon Jun 25 2018 returns Fri Jun 29 2018" do
      {:ok, date} = Date.new(2018, 6, 25)
      assert ~D[2018-06-29] == Workdays.next_last_workday(date)
    end

    test "Fri Jun 29 2018 returns Fri Jun 29 2018" do
      {:ok, date} = Date.new(2018, 6, 29)
      assert ~D[2018-06-29] == Workdays.next_last_workday(date)
    end

    test "Sat Jun 30 2018 returns Tue Jul 31 2018" do
      {:ok, date} = Date.new(2018, 6, 30)
      assert ~D[2018-07-31] == Workdays.next_last_workday(date)
    end

    test "Sat Dec 29 2018 returns Mon Dec 31 2018" do
      {:ok, date} = Date.new(2018, 12, 29)
      assert ~D[2018-12-31] == Workdays.next_last_workday(date)
    end

    test "Sun Dec 31 2017 returns Wed Jan 31 2018" do
      {:ok, date} = Date.new(2018, 1, 31)
      assert ~D[2018-01-31] == Workdays.next_last_workday(date)
    end
  end
end
