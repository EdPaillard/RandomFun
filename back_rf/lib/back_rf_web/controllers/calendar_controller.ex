defmodule BackRfWeb.CalendarController do
  use BackRfWeb, :controller

  alias BackRf.Random
  alias BackRf.Random.Calendar

  action_fallback BackRfWeb.FallbackController

  def index(conn, _params) do
    calendar = Random.list_calendar()
    render(conn, "index.json", calendar: calendar)
  end

  def create(conn, %{"calendar" => calendar_params}) do
    with {:ok, %Calendar{} = calendar} <- Random.create_calendar(calendar_params) do
      conn
      |> put_status(:created)
      |> json(calendar.game_name)
    end
  end

  def show(conn, %{"id" => id}) do
    calendar = Random.get_calendar!(id)
    render(conn, "show.json", calendar: calendar)
  end

  def update(conn, %{"id" => id, "calendar" => calendar_params}) do
    calendar = Random.get_calendar!(id)

    with {:ok, %Calendar{} = calendar} <- Random.update_calendar(calendar, calendar_params) do
      render(conn, "show.json", calendar: calendar)
    end
  end

  def delete(conn, %{"id" => id}) do
    calendar = Random.get_calendar!(id)

    with {:ok, %Calendar{}} <- Random.delete_calendar(calendar) do
      send_resp(conn, :no_content, "")
    end
  end
end
