defmodule BackRf.Random.Photo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "photos" do
    field :image, :binary

    timestamps()
  end

  @doc false
  def changeset(photo, attrs) do
    photo
    |> cast(attrs, [:image])
    |> validate_required([:image])
  end
end
