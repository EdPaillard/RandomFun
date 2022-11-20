defmodule BackRf.Repo do
  use Ecto.Repo,
    otp_app: :back_rf,
    adapter: Ecto.Adapters.Postgres
end
