defmodule BackRf.Repo.Migrations.CreateCalendar do
  use Ecto.Migration

  def change do
    create table(:calendar) do
      add :image, :binary
      add :game_name, :string
      add :end_time, :naive_datetime
      add :start_time, :naive_datetime

      timestamps()
    end
  end
end
