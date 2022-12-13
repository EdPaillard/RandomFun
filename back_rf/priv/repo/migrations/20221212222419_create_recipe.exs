defmodule BackRf.Repo.Migrations.CreateRecipe do
  use Ecto.Migration

  def change do
    create table(:recipe) do
      add :recipe_id, :string

      timestamps()
    end
  end
end
