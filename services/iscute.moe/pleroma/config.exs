use Mix.Config

config :pleroma, Pleroma.Upload,
  uploads: "/uploads"

config :pleroma, Pleroma.Web.Endpoint,
  http: [port: 4000],
  protocol: "http",
  url: [host: "iscute.moe", scheme: "https", port: 443]

config :pleroma, :instance,
  name: "iscute.moe",
  email: "chris@rx14.co.uk",
  limit: 5000,
  registrations_open: true,
  rewrite_policy: Pleroma.Web.ActivityPub.MRF.TheThreadPolicy

config :pleroma, :media_proxy,
  enabled: false,
  redirect_on_failure: true

config :pleroma, Pleroma.Repo,
  adapter: Ecto.Adapters.Postgres,
  hostname: "pleroma_db",
  username: "pleroma",
  database: "pleroma_prod",
  pool_size: 10

config :logger,
  level: :info

config :tzdata, :data_dir, "/tmp/elixir_tzdata_data"

import_config "prod.secret.exs"
