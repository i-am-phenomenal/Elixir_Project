defmodule ElixirProject.PeopleManagementQueries do
  alias ElixirProject.Schema.{Person}
  alias ElixirProject.Repo
  # import Ecto.Query
  # import Ecto.Multi

  def create_person(person_map) do
    Person.create_changeset(person_map)
    |> Repo.insert()
  end
end
