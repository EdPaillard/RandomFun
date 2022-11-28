defmodule BackRf.RandomTest do
  use BackRf.DataCase

  alias BackRf.Random

  describe "games" do
    alias BackRf.Random.Game

    import BackRf.RandomFixtures

    @invalid_attrs %{description: nil, image: nil, name: nil}

    test "list_games/0 returns all games" do
      game = game_fixture()
      assert Random.list_games() == [game]
    end

    test "get_game!/1 returns the game with given id" do
      game = game_fixture()
      assert Random.get_game!(game.id) == game
    end

    test "create_game/1 with valid data creates a game" do
      valid_attrs = %{description: "some description", image: "some image", name: "some name"}

      assert {:ok, %Game{} = game} = Random.create_game(valid_attrs)
      assert game.description == "some description"
      assert game.image == "some image"
      assert game.name == "some name"
    end

    test "create_game/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Random.create_game(@invalid_attrs)
    end

    test "update_game/2 with valid data updates the game" do
      game = game_fixture()
      update_attrs = %{description: "some updated description", image: "some updated image", name: "some updated name"}

      assert {:ok, %Game{} = game} = Random.update_game(game, update_attrs)
      assert game.description == "some updated description"
      assert game.image == "some updated image"
      assert game.name == "some updated name"
    end

    test "update_game/2 with invalid data returns error changeset" do
      game = game_fixture()
      assert {:error, %Ecto.Changeset{}} = Random.update_game(game, @invalid_attrs)
      assert game == Random.get_game!(game.id)
    end

    test "delete_game/1 deletes the game" do
      game = game_fixture()
      assert {:ok, %Game{}} = Random.delete_game(game)
      assert_raise Ecto.NoResultsError, fn -> Random.get_game!(game.id) end
    end

    test "change_game/1 returns a game changeset" do
      game = game_fixture()
      assert %Ecto.Changeset{} = Random.change_game(game)
    end
  end

  describe "sentences" do
    alias BackRf.Random.Sentence

    import BackRf.RandomFixtures

    @invalid_attrs %{author: nil, sentence: nil}

    test "list_sentences/0 returns all sentences" do
      sentence = sentence_fixture()
      assert Random.list_sentences() == [sentence]
    end

    test "get_sentence!/1 returns the sentence with given id" do
      sentence = sentence_fixture()
      assert Random.get_sentence!(sentence.id) == sentence
    end

    test "create_sentence/1 with valid data creates a sentence" do
      valid_attrs = %{author: "some author", sentence: "some sentence"}

      assert {:ok, %Sentence{} = sentence} = Random.create_sentence(valid_attrs)
      assert sentence.author == "some author"
      assert sentence.sentence == "some sentence"
    end

    test "create_sentence/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Random.create_sentence(@invalid_attrs)
    end

    test "update_sentence/2 with valid data updates the sentence" do
      sentence = sentence_fixture()
      update_attrs = %{author: "some updated author", sentence: "some updated sentence"}

      assert {:ok, %Sentence{} = sentence} = Random.update_sentence(sentence, update_attrs)
      assert sentence.author == "some updated author"
      assert sentence.sentence == "some updated sentence"
    end

    test "update_sentence/2 with invalid data returns error changeset" do
      sentence = sentence_fixture()
      assert {:error, %Ecto.Changeset{}} = Random.update_sentence(sentence, @invalid_attrs)
      assert sentence == Random.get_sentence!(sentence.id)
    end

    test "delete_sentence/1 deletes the sentence" do
      sentence = sentence_fixture()
      assert {:ok, %Sentence{}} = Random.delete_sentence(sentence)
      assert_raise Ecto.NoResultsError, fn -> Random.get_sentence!(sentence.id) end
    end

    test "change_sentence/1 returns a sentence changeset" do
      sentence = sentence_fixture()
      assert %Ecto.Changeset{} = Random.change_sentence(sentence)
    end
  end

  describe "photos" do
    alias BackRf.Random.Photo

    import BackRf.RandomFixtures

    @invalid_attrs %{image: nil}

    test "list_photos/0 returns all photos" do
      photo = photo_fixture()
      assert Random.list_photos() == [photo]
    end

    test "get_photo!/1 returns the photo with given id" do
      photo = photo_fixture()
      assert Random.get_photo!(photo.id) == photo
    end

    test "create_photo/1 with valid data creates a photo" do
      valid_attrs = %{image: "some image"}

      assert {:ok, %Photo{} = photo} = Random.create_photo(valid_attrs)
      assert photo.image == "some image"
    end

    test "create_photo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Random.create_photo(@invalid_attrs)
    end

    test "update_photo/2 with valid data updates the photo" do
      photo = photo_fixture()
      update_attrs = %{image: "some updated image"}

      assert {:ok, %Photo{} = photo} = Random.update_photo(photo, update_attrs)
      assert photo.image == "some updated image"
    end

    test "update_photo/2 with invalid data returns error changeset" do
      photo = photo_fixture()
      assert {:error, %Ecto.Changeset{}} = Random.update_photo(photo, @invalid_attrs)
      assert photo == Random.get_photo!(photo.id)
    end

    test "delete_photo/1 deletes the photo" do
      photo = photo_fixture()
      assert {:ok, %Photo{}} = Random.delete_photo(photo)
      assert_raise Ecto.NoResultsError, fn -> Random.get_photo!(photo.id) end
    end

    test "change_photo/1 returns a photo changeset" do
      photo = photo_fixture()
      assert %Ecto.Changeset{} = Random.change_photo(photo)
    end
  end

  describe "images" do
    alias BackRf.Random.Images

    import BackRf.RandomFixtures

    @invalid_attrs %{image: nil}

    test "list_images/0 returns all images" do
      images = images_fixture()
      assert Random.list_images() == [images]
    end

    test "get_images!/1 returns the images with given id" do
      images = images_fixture()
      assert Random.get_images!(images.id) == images
    end

    test "create_images/1 with valid data creates a images" do
      valid_attrs = %{image: "some image"}

      assert {:ok, %Images{} = images} = Random.create_images(valid_attrs)
      assert images.image == "some image"
    end

    test "create_images/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Random.create_images(@invalid_attrs)
    end

    test "update_images/2 with valid data updates the images" do
      images = images_fixture()
      update_attrs = %{image: "some updated image"}

      assert {:ok, %Images{} = images} = Random.update_images(images, update_attrs)
      assert images.image == "some updated image"
    end

    test "update_images/2 with invalid data returns error changeset" do
      images = images_fixture()
      assert {:error, %Ecto.Changeset{}} = Random.update_images(images, @invalid_attrs)
      assert images == Random.get_images!(images.id)
    end

    test "delete_images/1 deletes the images" do
      images = images_fixture()
      assert {:ok, %Images{}} = Random.delete_images(images)
      assert_raise Ecto.NoResultsError, fn -> Random.get_images!(images.id) end
    end

    test "change_images/1 returns a images changeset" do
      images = images_fixture()
      assert %Ecto.Changeset{} = Random.change_images(images)
    end
  end
end
