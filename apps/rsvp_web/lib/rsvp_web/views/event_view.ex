defmodule RsvpWeb.EventView do
  use RsvpWeb, :view

  def format_date(date) do
    "#{date.month}/#{date.day}/#{date.year}"
  end
end
