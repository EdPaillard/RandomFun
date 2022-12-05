defmodule BackRfWeb.GameController do
  use BackRfWeb, :controller

  alias BackRf.Random
  alias BackRf.Random.Game

  action_fallback BackRfWeb.FallbackController

  def index(conn, _params) do
    games = Random.list_games()
    conn
    |> put_status(200)
    |> json(games)
    # render(conn, "index.json", games: games)
  end

  def create(conn, %{"game" => game_params}) do
    with {:ok, %Game{} = game} <- Random.create_game(game_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.game_path(conn, :show, game))
      |> render("show.json", game: game)
    end
  end

  def get_random(conn, _params) do
    game = Random.get_random_game()
    conn
    |> put_status(200)
    |> json(game)
  end

  def show(conn, %{"id" => id}) do
    game = Random.get_game!(id)
    render(conn, "show.json", game: game)
  end

  def update(conn, %{"id" => id, "game" => game_params}) do
    game = Random.get_game!(id)
    with {:ok, %Game{} = game} <- Random.update_game(game, %{"game" => game_params}) do
      conn
      |> put_status(200)
      |> json(game)
    end
  end

  def delete(conn, %{"id" => id}) do
    game = Random.get_game!(id)

    with {:ok, %Game{}} <- Random.delete_game(game) do
      send_resp(conn, :no_content, "")
    end
  end
end
