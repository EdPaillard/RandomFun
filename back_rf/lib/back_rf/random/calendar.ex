defmodule BackRf.Random.Calendar do
  use Ecto.Schema
  import Ecto.Changeset

  schema "calendar" do
    field :end_time, :naive_datetime
    field :game_name, :string
    field :image, :binary
    field :start_time, :naive_datetime

    timestamps()
  end

  @doc false
  def changeset(calendar, attrs) do
    calendar
    |> cast(attrs, [:image, :game_name, :end_time, :start_time])
    |> validate_required([:image, :game_name, :end_time, :start_time])
  end
end
