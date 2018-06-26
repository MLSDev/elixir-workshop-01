defmodule ReminderApp.Workdays do
  @moduledoc """
  Workday helper functions
  """

  @doc """
  Checks whether the given `date` is a workday.

  Returns `true` or `false`.
  """
  def is_workday(%Date{} = date), do: Timex.weekday(date) in 1..5

  @doc """
  Calculates next last workday of month taking given `date` into account.

  Returns `Date` struct.
  """
  def next_last_workday(%Date{} = date) do
    last_wd = last_workday(date)
    if Timex.after?(date, last_wd) do
      Timex.shift(date, days: 1) |> last_workday
    else
      last_wd
    end
  end

  @doc """
  Last workday of a month from a given `date`.

  Returns `Date` struct.
  """
  def last_workday(%Date{} = date) do
    Timex.end_of_month(date) |> find_last_workday
  end

  defp find_last_workday(date) do
    if is_workday(date) do
      date
    else
      Timex.shift(date, days: -1) |> find_last_workday
    end
  end
end
