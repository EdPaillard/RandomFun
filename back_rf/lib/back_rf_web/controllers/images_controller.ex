defmodule BackRfWeb.ImagesController do
  use BackRfWeb, :controller

  alias BackRf.Random
  alias BackRf.Random.Images

  action_fallback BackRfWeb.FallbackController

  def index(conn, _params) do
    images = Random.list_images()
    render(conn, "index.json", images: images)
  end

  def create(conn, %{"images" => images_params}) do
    if(File.exists?(images_params.path)) do
      case File.read(images_params.path) do
        {:ok, body} -> data = IO.iodata_to_binary(body)
        with {:ok, %Images{} = images} <- Random.create_images(%{"image" => data}) do
          conn
          |> put_resp_content_type("image/png")
          |> send_resp(200, images.image)
        end
        {:error, posix} -> IO.inspect(item: posix, label: "POSIX")
      end
    end
  end

  def show(conn, %{"id" => id}) do
    images = Random.get_images!(id)
    conn
    |> put_resp_content_type("image/png")
    |> send_resp(200, images.image)
  end

  def update(conn, %{"id" => id, "images" => images_params}) do
    images = Random.get_images!(id)

    with {:ok, %Images{} = images} <- Random.update_images(images, images_params) do
      render(conn, "show.json", images: images)
    end
  end

  def delete(conn, %{"id" => id}) do
    images = Random.get_images!(id)

    with {:ok, %Images{}} <- Random.delete_images(images) do
      send_resp(conn, :no_content, "")
    end
  end
end
