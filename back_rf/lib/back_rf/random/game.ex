defmodule BackRf.Random.Game do
  use Ecto.Schema
  import Ecto.Changeset

  schema "games" do
    field :description, :string
    field :image, :binary
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:name, :image, :description])
    |> validate_required([:name, :image, :description])
  end
end
