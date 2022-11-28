defmodule BackRf.Random.Images do
  use Ecto.Schema
  import Ecto.Changeset

  schema "images" do
    field :image, :binary

    timestamps()
  end

  @doc false
  def changeset(images, attrs) do
    images
    |> cast(attrs, [:image])
    |> validate_required([:image])
  end
end
