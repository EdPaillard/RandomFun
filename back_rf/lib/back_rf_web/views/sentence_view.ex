defmodule BackRfWeb.SentenceView do
  use BackRfWeb, :view
  alias BackRfWeb.SentenceView

  def render("index.json", %{sentences: sentences}) do
    %{data: render_many(sentences, SentenceView, "sentence.json")}
  end

  def render("show.json", %{sentence: sentence}) do
    %{data: render_one(sentence, SentenceView, "sentence.json")}
  end

  def render("sentence.json", %{sentence: sentence}) do
    %{
      id: sentence.id,
      author: sentence.author,
      sentence: sentence.sentence
    }
  end
end
