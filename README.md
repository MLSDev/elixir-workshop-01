# Reminder app

Internal MLSDev Elixir Workshop #01 - Automated Slack reminder.

## Up and running

* Set up Slack Webhook URL and reminder text in `config/dev.secret.exs`:
  ```elixir
  use Mix.Config

  config :reminder_app,
    slack_webhook: "https://hooks.slack.com/services/your-hook",
    reminder_text: "hello from otp"
  ```
* `mix deps.get`
* `mix test`
* `iex -S mix`

## Docs

* `mix docs`
* `open doc/index.html`

## Coverage

* `mix test --cover`

HTML output:
* `mix coveralls.html`
* `open cover/excoveralls.html`
