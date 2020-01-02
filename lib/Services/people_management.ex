defmodule ElixirProject.PeopleManagement do
  alias ElixirProject.PeopleManagementQueries
  # alias ElixirProject.Repo
  # alias ElixirProject.Schema.{Person}
  # import Ecto.Query

  def create_person(person_struct) do
    PeopleManagementQueries.create_person(person_struct)
  end

  def check_admin_creds(username, password) do
    if username == "Admin" or username == "chat29aditya@gmail.com" do
      if password == "Admin" do
        True
      else
        False
      end
    else
      False
    end
  end
end
