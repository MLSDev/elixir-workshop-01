defmodule ReminderApp.Slack do
  @type ok_or_error :: :ok | {:ok, result :: any} | :error | {:error, reason :: any}

  @callback post(webhook :: String.t, text :: String.t, http_client :: atom) :: ok_or_error
end
