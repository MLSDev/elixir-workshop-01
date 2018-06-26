defmodule ReminderApp do
  @moduledoc """
  Documentation for ReminderApp.
  """

  @slack_client Application.get_env(:reminder_app, :slack_client)

  @hook Application.get_env(:reminder_app, :slack_webhook)

  @reminder_message ~S"""
  Всем привет!
  Сегодня последний рабочий день месяца.
  Просьба ко всем заполнить *Harvest* в конце дня во избежание недоразумений при выплате компенсации за Ваш нелегкий труд! :)
  """

  @doc """
  Send reminder to Slack channel
  """
  def remind do
    {:ok, _response} = @slack_client.post(@hook, @reminder_message)
    :ok
  end
end
