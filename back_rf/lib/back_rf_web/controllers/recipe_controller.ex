defmodule BackRfWeb.RecipeController do
  use BackRfWeb, :controller

  alias BackRf.Random
  alias BackRf.Random.Recipe

  action_fallback BackRfWeb.FallbackController

  def index(conn, _params) do
    recipe = Random.list_recipe()
    render(conn, "index.json", recipe: recipe)
  end

  def create(conn, %{"recipe_id" => recipe_id}) do
    recipe_param = %{"recipe_id" => recipe_id}
    with {:ok, %Recipe{} = recipe} <- Random.create_recipe(recipe_param) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.recipe_path(conn, :show, recipe))
      |> render("show.json", recipe: recipe)
    end
  end

  def show(conn, %{"id" => id}) do
    recipe = Random.get_recipe!(id)
    render(conn, "show.json", recipe: recipe)
  end

  def update(conn, %{"id" => id, "recipe" => recipe_params}) do
    recipe = Random.get_recipe!(id)

    with {:ok, %Recipe{} = recipe} <- Random.update_recipe(recipe, recipe_params) do
      render(conn, "show.json", recipe: recipe)
    end
  end

  def delete(conn, %{"id" => id}) do
    recipe = Random.get_recipe!(id)

    with {:ok, %Recipe{}} <- Random.delete_recipe(recipe) do
      send_resp(conn, :no_content, "")
    end
  end
end
