unless Rsvp.EventQueries.any() do
  {status, record} =
    Rsvp.Repo.insert(
      Rsvp.Events.changeset(%Rsvp.Events{}, %{
        date: ~U[2020-11-23 23:50:07Z],
        title: "Title 1",
        location: "Location 1"
      })
    )

  IO.puts(status, record)
end
