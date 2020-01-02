defmodule ElixirProjectWeb.PageController do
  use ElixirProjectWeb, :controller
  alias ElixirProject.PeopleManagement

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def admin(conn, _) do
    conn
    |> render("admin_login.html")
  end

  def check_admin_creds(conn, params) do
    user_name = params |> Map.get("user_name")
    password = params |> Map.get("password")

    creds_valid? = PeopleManagement.check_admin_creds(user_name, password)

    if creds_valid? == True do
      render(conn, "admin_home.html")
    else
      render(conn, "error_page.html")
    end
  end
end
