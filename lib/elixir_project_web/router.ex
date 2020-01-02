defmodule ElixirProjectWeb.Router do
  use ElixirProjectWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", ElixirProjectWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/admin_login", PageController, :admin)
    post("/check_admin_creds", PageController, :check_admin_creds)

    get("/", PageController, :index)
  end

  # Other scopes may use custom stacks.
  # scope "/api", ElixirProjectWeb do
  #   pipe_through :api
  # end
end
