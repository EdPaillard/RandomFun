defmodule BackRf.Repo.Migrations.CreateImages do
  use Ecto.Migration

  def change do
    create table(:images) do
      add :image, :binary

      timestamps()
    end
  end
end
