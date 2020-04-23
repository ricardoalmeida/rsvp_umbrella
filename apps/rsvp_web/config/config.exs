# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :rsvp_web, RsvpWebWeb.Endpoint,
  url: [host: "localhost:4000"],
  # http: [port: 4000],
  secret_key_base: "iA8UcKVc3TyUEEJEb4ikjyzkk9zAMujpIW4JmGWoXL9UY8JU0FiJGZuwqxbNi8fK",
  render_errors: [view: RsvpWebWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: RsvpWeb.PubSub,
  live_view: [signing_salt: "iI+PAyzH"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
