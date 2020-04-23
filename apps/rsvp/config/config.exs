use Mix.Config

config :rsvp, Rsvp.Repo,
  username: "postgres",
  password: "",
  database: "rsvp_dev",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

config :rsvp, ecto_repos: [Rsvp.Repo]

use Mix.Config
