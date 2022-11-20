defmodule BackRfWeb.GameView do
  use BackRfWeb, :view
  alias BackRfWeb.GameView

  def render("index.json", %{games: games}) do
    %{data: render_many(games, GameView, "game.json")}
  end

  def render("show.json", %{game: game}) do
    %{data: render_one(game, GameView, "game.json")}
  end

  def render("game.json", %{game: game}) do
    %{
      id: game.id,
      name: game.name,
      image: game.image,
      description: game.description
    }
  end
end
