defmodule SharaBackend.Repo do
  use Ecto.Repo,
    otp_app: :shara_backend,
    adapter: Ecto.Adapters.Postgres
end
