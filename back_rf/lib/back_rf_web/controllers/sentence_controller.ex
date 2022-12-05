defmodule BackRfWeb.SentenceController do
  use BackRfWeb, :controller

  alias BackRf.Random
  alias BackRf.Random.Sentence

  action_fallback BackRfWeb.FallbackController

  def index(conn, _params) do
    sentences = Random.list_sentences()
    render(conn, "index.json", sentences: sentences)
  end

  def create(conn, %{"sentences" => sentence_params}) do
    with {:ok, %Sentence{} = sentence} <- Random.create_sentence(sentence_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.sentence_path(conn, :show, sentence))
      |> render("show.json", sentence: sentence)
    end
  end

  def get_random(conn, _params) do
    sentences_length = Random.get_sentences_length()
    random_index = :rand.uniform(sentences_length)
    sentence = Random.get_photo!(random_index)
    conn
    |> put_status(200)
    |> json(sentence)
  end

  def show(conn, %{"id" => id}) do
    sentence = Random.get_sentence!(id)
    render(conn, "show.json", sentence: sentence)
  end

  def update(conn, %{"id" => id, "sentences" => sentence_params}) do
    sentence = Random.get_sentence!(id)

    with {:ok, %Sentence{} = sentence} <- Random.update_sentence(sentence, sentence_params) do
      render(conn, "show.json", sentence: sentence)
    end
  end

  def delete(conn, %{"id" => id}) do
    sentence = Random.get_sentence!(id)

    with {:ok, %Sentence{}} <- Random.delete_sentence(sentence) do
      send_resp(conn, :no_content, "")
    end
  end
end
