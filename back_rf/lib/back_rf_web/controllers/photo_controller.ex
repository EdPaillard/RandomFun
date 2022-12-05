defmodule BackRfWeb.PhotoController do
  use BackRfWeb, :controller

  alias BackRf.Random
  alias BackRf.Random.Photo

  action_fallback BackRfWeb.FallbackController

  def index(conn, _params) do
    photos = Random.list_photos()
    images = Enum.map(photos, fn val -> [] ++ val.image end)
    conn
    |> put_resp_content_type("image/png")
    |> send_resp(200, images)
    # |> render("index.json", photos: photos)
  end

  def get_length(conn, _params) do
    photos_length = Random.get_photo_length()
    # photos = Random.list_photos()
    # list_length = length(photos)

    conn
    |> put_status(200)
    |> json(photos_length)
  end

  def get_random(conn, _params) do
    photo = List.first(Random.get_random_photo())
    conn
    |> put_resp_content_type("image/png")
    |> send_resp(200, photo.image)
  end

  def create(conn, %{"image" => photo_params}) do
    if(File.exists?(photo_params.path)) do
      case File.read(photo_params.path) do
        {:ok, body} -> data = IO.iodata_to_binary(body)
        with {:ok, %Photo{} = photo} <- Random.create_photo(%{"image" => data}) do
          conn
          |> put_resp_content_type("image/png")
          |> send_resp(200, photo.image)
        end
        {:error, posix} -> IO.inspect(item: posix, label: "POSIX")
      end
    end
  end

  def show(conn, %{"id" => id}) do
    photo = Random.get_photo!(id)
    conn
    |> put_resp_content_type("image/png")
    |> send_resp(200, photo.image)
    # render(conn, "show.json", photo: photo)
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
