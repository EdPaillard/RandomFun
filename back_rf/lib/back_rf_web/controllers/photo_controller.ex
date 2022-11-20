defmodule BackRfWeb.PhotoController do
  use BackRfWeb, :controller

  alias BackRf.Random
  alias BackRf.Random.Photo

  action_fallback BackRfWeb.FallbackController

  def index(conn, _params) do
    photos = Random.list_photos()
    render(conn, "index.json", photos: photos)
  end

  def create(conn, %{"photo" => photo_params}) do
    with {:ok, %Photo{} = photo} <- Random.create_photo(photo_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.photo_path(conn, :show, photo))
      |> render("show.json", photo: photo)
    end
  end

  def show(conn, %{"id" => id}) do
    photo = Random.get_photo!(id)
    render(conn, "show.json", photo: photo)
  end

  def update(conn, %{"id" => id, "photo" => photo_params}) do
    photo = Random.get_photo!(id)

    with {:ok, %Photo{} = photo} <- Random.update_photo(photo, photo_params) do
      render(conn, "show.json", photo: photo)
    end
  end

  def delete(conn, %{"id" => id}) do
    photo = Random.get_photo!(id)

    with {:ok, %Photo{}} <- Random.delete_photo(photo) do
      send_resp(conn, :no_content, "")
    end
  end
end
