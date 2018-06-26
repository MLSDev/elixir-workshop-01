defmodule ReminderApp do
  @moduledoc """
  Documentation for ReminderApp.
  """

  @slack_client Application.get_env(:reminder_app, :slack_client)

  @hook Application.get_env(:reminder_app, :slack_webhook)

  @reminder_message Application.get_env(:reminder_app, :reminder_text)

  @doc """
  Send reminder to Slack channel.
  """
  def remind do
    {:ok, _response} = @slack_client.post(@hook, @reminder_message)
    :ok
  end

  @doc """
  Schedule the reminder.
  """
  def schedule(date \\ Timex.today) do
    date
    |> ReminderApp.Workdays.next_last_workday
    |> Timex.to_naive_datetime
    |> Timex.set(hour: 12)
    |> ReminderApp.Worker.schedule(ReminderApp, :remind_and_schedule)
  end

  @doc """
  Function to pass to Worker.
  """
  def remind_and_schedule do
    remind()

    Timex.today
    |> Timex.shift(days: 1)
    |> schedule()
  end
end
