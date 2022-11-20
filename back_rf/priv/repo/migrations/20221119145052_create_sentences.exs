defmodule BackRf.Repo.Migrations.CreateSentences do
  use Ecto.Migration

  def change do
    create table(:sentences) do
      add :author, :string
      add :sentence, :string

      timestamps()
    end
  end
end
