defmodule ReminderApp.Slack.Sandbox do
  @behaviour ReminderApp.Slack

  @moduledoc false

  def post(webhook, _text, _http_client \\ nil) do
    {:ok,
      %{
        body: "ok",
        headers: [{"Content-Type", "text/html"}],
        request_url: webhook,
        status_code: 200
    }}
  end
end
