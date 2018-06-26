defmodule ReminderApp.Slack.ClientTest do
  use ExUnit.Case

  alias ReminderApp.Slack.Client

  defmodule DummyHTTP do
    def post(url, _body, headers) do
      {:ok, %HTTPoison.Response{body: "ok", request_url: url, headers: headers, status_code: 200}}
    end
  end

  test "post/3 sends message via webhook" do
    {:ok, response} = Client.post("https://api.slack.com/services/a/b/c", "hello!", DummyHTTP)
    assert 200 == response.status_code
  end
end
