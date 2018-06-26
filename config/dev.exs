use Mix.Config

config :reminder_app, slack_client: ReminderApp.Slack.Client

import_config "dev.secret.exs"

