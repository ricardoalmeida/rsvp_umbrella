defmodule RsvpWeb.EventViewTest do
  use RsvpWeb.ConnCase, async: true

  test "Should convert a date to a M/D/YY format" do
    {:ok, datetime, 0} = DateTime.from_iso8601("2020-02-12T23:50:07Z")

    formatted = RsvpWeb.EventView.format_date(datetime)
    assert formatted == "2/12/2020"
  end
end
