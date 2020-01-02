# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ElixirProject.Repo.insert!(%ElixirProject.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias ElixirProject.Schema.{Person, Movie}
alias ElixirProject.Repo
alias ElixirProject.PeopleManagement
import File

IO.puts("DELETING DATA FROM ALL TABLES ")
Repo.delete_all(Person)

IO.puts("DATA DELETED")
IO.puts("SEEDING DATA")

jimmy = %{
  uuid: UUID.uuid4(),
  first_name: "Jimmy",
  last_name: "Hobbit",
  email: "jimmy@hotmail.com",
  password: "jimmy"
}

harry = %{
  uuid: UUID.uuid4(),
  first_name: "Harry",
  last_name: "Potter",
  email: "harrypotter29@gmail.com",
  password: "hogwarts"
}

john = %{
  uuid: UUID.uuid4(),
  first_name: "John",
  last_name: "Wick",
  email: "keanureeves@yahoo.com",
  password: "hitman"
}

ethan = %{
  uuid: UUID.uuid4(),
  first_name: "Ethan",
  last_name: "Hunt",
  email: "cool20ethan@gmail.com",
  password: "great"
}

rajesh = %{
  uuid: UUID.uuid4(),
  first_name: "Rajesh",
  last_name: "Roshan",
  email: "rajeshroshan@yahoo.com",
  password: "parody"
}

shubham = %{
  uuid: UUID.uuid4(),
  first_name: "Shubham",
  last_name: "Thakur",
  email: "shubhamthakur@ts.com",
  password: "elmyear"
}

vikrant = %{
  uuid: UUID.uuid4(),
  first_name: "Vikrant",
  last_name: "Rajput",
  email: "vkrajput@gmail.com",
  password: "angular"
}

mandeep = %{
  uuid: UUID.uuid4(),
  first_name: "Mandeep",
  last_name: "Singh",
  email: "masterofscrum@gmail.com",
  password: "agile"
}

admin = %{
  uuid: UUID.uuid4(),
  first_name: "Admin",
  last_name: " ",
  email: "chat29aditya@gmail.com",
  password: "Admin"
}

people = [jimmy, harry, john, ethan, rajesh, shubham, vikrant, mandeep, admin]

people
|> Enum.map(fn person ->
  PeopleManagement.create_person(person)
end)

{:ok, json_file} = File.read("C:/JsonData/json_data_2.txt")
{:ok, parsed_json} = Poison.decode(json_file)

parsed_json
|> Enum.map(fn json ->
  Movie.create_changeset(json)
  |> Repo.insert()
end)
