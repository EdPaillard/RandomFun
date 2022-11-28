defmodule BackRf.RandomFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BackRf.Random` context.
  """

  @doc """
  Generate a game.
  """
  def game_fixture(attrs \\ %{}) do
    {:ok, game} =
      attrs
      |> Enum.into(%{
        description: "some description",
        image: "some image",
        name: "some name"
      })
      |> BackRf.Random.create_game()

    game
  end

  @doc """
  Generate a sentence.
  """
  def sentence_fixture(attrs \\ %{}) do
    {:ok, sentence} =
      attrs
      |> Enum.into(%{
        author: "some author",
        sentence: "some sentence"
      })
      |> BackRf.Random.create_sentence()

    sentence
  end

  @doc """
  Generate a photo.
  """
  def photo_fixture(attrs \\ %{}) do
    {:ok, photo} =
      attrs
      |> Enum.into(%{
        image: "some image"
      })
      |> BackRf.Random.create_photo()

    photo
  end

  @doc """
  Generate a images.
  """
  def images_fixture(attrs \\ %{}) do
    {:ok, images} =
      attrs
      |> Enum.into(%{
        image: "some image"
      })
      |> BackRf.Random.create_images()

    images
  end
end
