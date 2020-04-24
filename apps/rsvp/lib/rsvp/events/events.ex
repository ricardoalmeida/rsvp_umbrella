defmodule Rsvp.Events do
  use Ecto.Schema

  import Ecto.Changeset

  schema "events" do
    field(:title, :string)
    field(:location, :string)
    field(:date, :utc_datetime)
    field(:description, :string)

    timestamps()
  end

  def changeset(event, params \\ %{}) do
    event
    |> cast(params, [:title, :location, :date, :description])
    |> validate_required([:title, :location, :date])
    |> validate_change(:date, &must_be_future/2)
  end

  defp must_be_future(_, value) do
    DateTime.compare(value, DateTime.utc_now())
    |> get_error
  end

  defp get_error(comparison) when comparison == :lt, do: [date: "Cannot be in the past"]
  defp get_error(_), do: []
end
