defmodule BackRf.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :name, :string
      add :image, :binary
      add :description, :string

      timestamps()
    end
  end
end
