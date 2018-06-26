defmodule ReminderApp.MixProject do
  use Mix.Project

  def project do
    [
      app: :reminder_app,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [coveralls: :test, "coveralls.detail": :test, "coveralls.html": :test]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :timex],
      mod: {ReminderApp.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:timex, "~> 3.0"},
      {:jason, "~> 1.0"},
      {:httpoison, "~> 1.0"},
      {:excoveralls, "~> 0.8", only: :test}
    ]
  end
end
