defmodule BackRfWeb.Router do
  use BackRfWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug Plug.Parsers,
     parsers: [:url_encoded, :multipart],
     length: 200_000_000_000
  end

  scope "/api", BackRfWeb do
    pipe_through :api
    scope "/games" do
      resources "/games", GameController, except: [:new, :edit]
      get "/random/games", GameController, :get_random
    end
    scope "/sentences" do
      resources "/sentences", SentenceController, except: [:new, :edit]
      get "/random/sentences", SentenceController, :get_random
    end
    resources "/", ImagesController, except: [:new, :edit]
    scope "/photos" do
      resources "/", PhotoController, except: [:new, :edit]
      get "/list/length", PhotoController, :get_length
      get "/random/photos", PhotoController, :get_random
    end
    resources "/calendar", CalendarController, except: [:new, :edit]
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: BackRfWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
