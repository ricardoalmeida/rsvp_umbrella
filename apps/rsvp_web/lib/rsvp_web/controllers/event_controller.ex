defmodule RsvpWeb.EventController do
  use RsvpWeb, :controller

  def show(conn, %{"id" => id}) do
    event =
      Rsvp.EventQueries.get_by_id(id)
      |> IO.inspect()

    render(conn, "details.html", event: event)
  end

  def list(conn, _params) do
    events = Rsvp.EventQueries.get_all()
    render(conn, "list.html", events: events)
  end

  def create(conn, %{errors: errors}) do
    render(conn, "create.html", changeset: errors)
  end

  def create(conn, _params) do
    changeset = Rsvp.Events.changeset(%Rsvp.Events{}, %{})
    render(conn, "create.html", changeset: changeset)
  end

  def add(conn, %{"events" => event_params}) do
    changeset = Rsvp.Events.changeset(%Rsvp.Events{}, event_params)

    case Rsvp.EventQueries.create(changeset) do
      {:ok, %{id: id}} -> redirect(conn, to: Routes.event_path(conn, :show, id))
      {:error, reasons} -> create(conn, %{errors: reasons})
    end
  end
end
