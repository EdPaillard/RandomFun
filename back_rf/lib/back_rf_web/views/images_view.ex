defmodule BackRfWeb.ImagesView do
  use BackRfWeb, :view
  alias BackRfWeb.ImagesView

  def render("index.json", %{images: images}) do
    %{data: render_many(images, ImagesView, "images.json")}
  end

  def render("show.json", %{images: images}) do
    %{data: render_one(images, ImagesView, "images.json")}
  end

  def render("images.json", %{images: images}) do
    %{
      id: images.id,
      image: images.image
    }
  end
end
