defmodule BackRf.Random.Sentence do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sentences" do
    field :author, :string
    field :sentence, :string

    timestamps()
  end

  @doc false
  def changeset(sentence, attrs) do
    sentence
    |> cast(attrs, [:author, :sentence])
    |> validate_required([:author, :sentence])
  end
end
