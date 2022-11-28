defmodule BackRf.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :name, :string
      add :description, :text
      add :materiel, {:array, :string}
      add :goals, {:array, :string}
      add :conclusion, :text
      add :images_id, references(:images, on_delete: :delete_all)

      timestamps()
    end
  end
end
