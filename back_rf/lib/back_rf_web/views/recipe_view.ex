defmodule BackRfWeb.RecipeView do
  use BackRfWeb, :view
  alias BackRfWeb.RecipeView

  def render("index.json", %{recipe: recipe}) do
    %{data: render_many(recipe, RecipeView, "recipe.json")}
  end

  def render("show.json", %{recipe: recipe}) do
    %{data: render_one(recipe, RecipeView, "recipe.json")}
  end

  def render("recipe.json", %{recipe: recipe}) do
    %{
      id: recipe.id,
      recipe_id: recipe.recipe_id
    }
  end
end
