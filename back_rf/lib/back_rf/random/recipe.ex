defmodule BackRf.Random.Recipe do
  use Ecto.Schema
  import Ecto.Changeset

  schema "recipe" do
    field :recipe_id, :string

    timestamps()
  end

  @doc false
  def changeset(recipe, attrs) do
    recipe
    |> cast(attrs, [:recipe_id])
    |> validate_required([:recipe_id])
  end
end
