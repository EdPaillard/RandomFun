defmodule BackRf.Random.Game do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, except: [:__meta__]}
  schema "games" do
    field :description, :string
    field :materiel, {:array, :string}
    field :goals, {:array, :string}
    field :conclusion, :string
    field :name, :string
    field :images_id, :id

    timestamps()
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:name, :description, :materiel, :goals, :conclusion, :images_id])
    |> validate_required([:name, :description])
  end
end
