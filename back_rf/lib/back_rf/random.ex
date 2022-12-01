defmodule BackRf.Random do
  @moduledoc """
  The Random context.
  """

  import Ecto.Query, warn: false
  alias BackRf.Repo

  alias BackRf.Random.Game

  @doc """
  Returns the list of games.

  ## Examples

      iex> list_games()
      [%Game{}, ...]

  """
  def list_games do
    Repo.all(Game)
  end

  @doc """
  Gets a single game.

  Raises `Ecto.NoResultsError` if the Game does not exist.

  ## Examples

      iex> get_game!(123)
      %Game{}

      iex> get_game!(456)
      ** (Ecto.NoResultsError)

  """
  def get_game!(id), do: Repo.get!(Game, id)

  @doc """
  Creates a game.

  ## Examples

      iex> create_game(%{field: value})
      {:ok, %Game{}}

      iex> create_game(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_game(attrs \\ %{}) do
    %Game{}
    |> Game.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a game.

  ## Examples

      iex> update_game(game, %{field: new_value})
      {:ok, %Game{}}

      iex> update_game(game, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_game(%Game{} = game, attrs) do
    game
    |> Game.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a game.

  ## Examples

      iex> delete_game(game)
      {:ok, %Game{}}

      iex> delete_game(game)
      {:error, %Ecto.Changeset{}}

  """
  def delete_game(%Game{} = game) do
    Repo.delete(game)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking game changes.

  ## Examples

      iex> change_game(game)
      %Ecto.Changeset{data: %Game{}}

  """
  def change_game(%Game{} = game, attrs \\ %{}) do
    Game.changeset(game, attrs)
  end

  alias BackRf.Random.Sentence

  @doc """
  Returns the list of sentences.

  ## Examples

      iex> list_sentences()
      [%Sentence{}, ...]

  """
  def list_sentences do
    Repo.all(Sentence)
  end

  @doc """
  Gets a single sentence.

  Raises `Ecto.NoResultsError` if the Sentence does not exist.

  ## Examples

      iex> get_sentence!(123)
      %Sentence{}

      iex> get_sentence!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sentence!(id), do: Repo.get!(Sentence, id)

  @doc """
  Creates a sentence.

  ## Examples

      iex> create_sentence(%{field: value})
      {:ok, %Sentence{}}

      iex> create_sentence(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sentence(attrs \\ %{}) do
    %Sentence{}
    |> Sentence.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sentence.

  ## Examples

      iex> update_sentence(sentence, %{field: new_value})
      {:ok, %Sentence{}}

      iex> update_sentence(sentence, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sentence(%Sentence{} = sentence, attrs) do
    sentence
    |> Sentence.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a sentence.

  ## Examples

      iex> delete_sentence(sentence)
      {:ok, %Sentence{}}

      iex> delete_sentence(sentence)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sentence(%Sentence{} = sentence) do
    Repo.delete(sentence)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sentence changes.

  ## Examples

      iex> change_sentence(sentence)
      %Ecto.Changeset{data: %Sentence{}}

  """
  def change_sentence(%Sentence{} = sentence, attrs \\ %{}) do
    Sentence.changeset(sentence, attrs)
  end

  alias BackRf.Random.Photo

  @doc """
  Returns the list of photos.

  ## Examples

      iex> list_photos()
      [%Photo{}, ...]

  """
  def list_photos do
    Repo.all(Photo)
  end

  @doc """
  Gets a single photo.

  Raises `Ecto.NoResultsError` if the Photo does not exist.

  ## Examples

      iex> get_photo!(123)
      %Photo{}

      iex> get_photo!(456)
      ** (Ecto.NoResultsError)

  """
  def get_photo!(id), do: Repo.get!(Photo, id)

  @doc """
  Creates a photo.

  ## Examples

      iex> create_photo(%{field: value})
      {:ok, %Photo{}}

      iex> create_photo(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_photo(attrs \\ %{}) do
    IO.inspect(item: attrs, label: "ATTRS")
    %Photo{}
    |> Photo.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a photo.

  ## Examples

      iex> update_photo(photo, %{field: new_value})
      {:ok, %Photo{}}

      iex> update_photo(photo, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_photo(%Photo{} = photo, attrs) do
    photo
    |> Photo.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a photo.

  ## Examples

      iex> delete_photo(photo)
      {:ok, %Photo{}}

      iex> delete_photo(photo)
      {:error, %Ecto.Changeset{}}

  """
  def delete_photo(%Photo{} = photo) do
    Repo.delete(photo)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking photo changes.

  ## Examples

      iex> change_photo(photo)
      %Ecto.Changeset{data: %Photo{}}

  """
  def change_photo(%Photo{} = photo, attrs \\ %{}) do
    Photo.changeset(photo, attrs)
  end

  alias BackRf.Random.Images

  @doc """
  Returns the list of images.

  ## Examples

      iex> list_images()
      [%Images{}, ...]

  """
  def list_images do
    Repo.all(Images)
  end

  @doc """
  Gets a single images.

  Raises `Ecto.NoResultsError` if the Images does not exist.

  ## Examples

      iex> get_images!(123)
      %Images{}

      iex> get_images!(456)
      ** (Ecto.NoResultsError)

  """
  def get_images!(id), do: Repo.get!(Images, id)

  @doc """
  Creates a images.

  ## Examples

      iex> create_images(%{field: value})
      {:ok, %Images{}}

      iex> create_images(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_images(attrs \\ %{}) do
    %Images{}
    |> Images.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a images.

  ## Examples

      iex> update_images(images, %{field: new_value})
      {:ok, %Images{}}

      iex> update_images(images, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_images(%Images{} = images, attrs) do
    images
    |> Images.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a images.

  ## Examples

      iex> delete_images(images)
      {:ok, %Images{}}

      iex> delete_images(images)
      {:error, %Ecto.Changeset{}}

  """
  def delete_images(%Images{} = images) do
    Repo.delete(images)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking images changes.

  ## Examples

      iex> change_images(images)
      %Ecto.Changeset{data: %Images{}}

  """
  def change_images(%Images{} = images, attrs \\ %{}) do
    Images.changeset(images, attrs)
  end

  alias BackRf.Random.Calendar

  @doc """
  Returns the list of calendar.

  ## Examples

      iex> list_calendar()
      [%Calendar{}, ...]

  """
  def list_calendar do
    Repo.all(Calendar)
  end

  @doc """
  Gets a single calendar.

  Raises `Ecto.NoResultsError` if the Calendar does not exist.

  ## Examples

      iex> get_calendar!(123)
      %Calendar{}

      iex> get_calendar!(456)
      ** (Ecto.NoResultsError)

  """
  def get_calendar!(id), do: Repo.get!(Calendar, id)

  @doc """
  Creates a calendar.

  ## Examples

      iex> create_calendar(%{field: value})
      {:ok, %Calendar{}}

      iex> create_calendar(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_calendar(attrs \\ %{}) do
    %Calendar{}
    |> Calendar.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a calendar.

  ## Examples

      iex> update_calendar(calendar, %{field: new_value})
      {:ok, %Calendar{}}

      iex> update_calendar(calendar, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_calendar(%Calendar{} = calendar, attrs) do
    calendar
    |> Calendar.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a calendar.

  ## Examples

      iex> delete_calendar(calendar)
      {:ok, %Calendar{}}

      iex> delete_calendar(calendar)
      {:error, %Ecto.Changeset{}}

  """
  def delete_calendar(%Calendar{} = calendar) do
    Repo.delete(calendar)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking calendar changes.

  ## Examples

      iex> change_calendar(calendar)
      %Ecto.Changeset{data: %Calendar{}}

  """
  def change_calendar(%Calendar{} = calendar, attrs \\ %{}) do
    Calendar.changeset(calendar, attrs)
  end
end
