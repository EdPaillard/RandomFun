defmodule BackRfWeb.CalendarControllerTest do
  use BackRfWeb.ConnCase

  import BackRf.RandomFixtures

  alias BackRf.Random.Calendar

  @create_attrs %{
    end_time: ~N[2022-11-29 22:09:00],
    game_name: "some game_name",
    image: "some image",
    start_time: ~N[2022-11-29 22:09:00]
  }
  @update_attrs %{
    end_time: ~N[2022-11-30 22:09:00],
    game_name: "some updated game_name",
    image: "some updated image",
    start_time: ~N[2022-11-30 22:09:00]
  }
  @invalid_attrs %{end_time: nil, game_name: nil, image: nil, start_time: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all calendar", %{conn: conn} do
      conn = get(conn, Routes.calendar_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create calendar" do
    test "renders calendar when data is valid", %{conn: conn} do
      conn = post(conn, Routes.calendar_path(conn, :create), calendar: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.calendar_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "end_time" => "2022-11-29T22:09:00",
               "game_name" => "some game_name",
               "image" => "some image",
               "start_time" => "2022-11-29T22:09:00"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.calendar_path(conn, :create), calendar: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update calendar" do
    setup [:create_calendar]

    test "renders calendar when data is valid", %{conn: conn, calendar: %Calendar{id: id} = calendar} do
      conn = put(conn, Routes.calendar_path(conn, :update, calendar), calendar: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.calendar_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "end_time" => "2022-11-30T22:09:00",
               "game_name" => "some updated game_name",
               "image" => "some updated image",
               "start_time" => "2022-11-30T22:09:00"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, calendar: calendar} do
      conn = put(conn, Routes.calendar_path(conn, :update, calendar), calendar: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete calendar" do
    setup [:create_calendar]

    test "deletes chosen calendar", %{conn: conn, calendar: calendar} do
      conn = delete(conn, Routes.calendar_path(conn, :delete, calendar))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.calendar_path(conn, :show, calendar))
      end
    end
  end

  defp create_calendar(_) do
    calendar = calendar_fixture()
    %{calendar: calendar}
  end
end
