defmodule BackRfWeb.PhotoControllerTest do
  use BackRfWeb.ConnCase

  import BackRf.RandomFixtures

  alias BackRf.Random.Photo

  @create_attrs %{
    image: "some image"
  }
  @update_attrs %{
    image: "some updated image"
  }
  @invalid_attrs %{image: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all photos", %{conn: conn} do
      conn = get(conn, Routes.photo_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create photo" do
    test "renders photo when data is valid", %{conn: conn} do
      conn = post(conn, Routes.photo_path(conn, :create), photo: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.photo_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "image" => "some image"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.photo_path(conn, :create), photo: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update photo" do
    setup [:create_photo]

    test "renders photo when data is valid", %{conn: conn, photo: %Photo{id: id} = photo} do
      conn = put(conn, Routes.photo_path(conn, :update, photo), photo: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.photo_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "image" => "some updated image"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, photo: photo} do
      conn = put(conn, Routes.photo_path(conn, :update, photo), photo: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete photo" do
    setup [:create_photo]

    test "deletes chosen photo", %{conn: conn, photo: photo} do
      conn = delete(conn, Routes.photo_path(conn, :delete, photo))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.photo_path(conn, :show, photo))
      end
    end
  end

  defp create_photo(_) do
    photo = photo_fixture()
    %{photo: photo}
  end
end
