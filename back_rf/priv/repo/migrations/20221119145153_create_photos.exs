defmodule BackRf.Repo.Migrations.CreatePhotos do
  use Ecto.Migration

  def change do
    create table(:photos) do
      add :image, :binary

      timestamps()
    end
  end
end
