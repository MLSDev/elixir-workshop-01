defmodule ReminderApp.Slack.Client do
  @behaviour ReminderApp.Slack

  @moduledoc """
  Slack API client
  """

  @doc """
  Post message to Slack channel via Web Hook
  """
  def post(webhook, text, http_client \\ HTTPoison) do
    headers = [{"Content-Type", "application/json"}]
    {:ok, body} = Jason.encode(%{text: text})
    {:ok, _} = http_client.post(webhook, body, headers)
  end
end
