defmodule BackRfWeb.CalendarView do
  use BackRfWeb, :view
  alias BackRfWeb.CalendarView

  def render("index.json", %{calendar: calendar}) do
    %{data: render_many(calendar, CalendarView, "calendar.json")}
  end

  def render("show.json", %{calendar: calendar}) do
    %{data: render_one(calendar, CalendarView, "calendar.json")}
  end

  def render("calendar.json", %{calendar: calendar}) do
    %{
      id: calendar.id,
      image: calendar.image,
      game_name: calendar.game_name,
      end_time: calendar.end_time,
      start_time: calendar.start_time
    }
  end
end
