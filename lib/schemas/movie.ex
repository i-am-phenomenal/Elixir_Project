defmodule ElixirProject.Schema.Movie do
  use Ecto.Schema
  import Ecto.Changeset
  alias ElixirProject.Schema.Movie

  @primary_key {:uuid, :binary_id, autogenerate: true}

  schema "movies" do
    field(:cast, {:array, :string})
    field(:genres, {:array, :string})
    field(:title, :string)
    field(:year, :integer)
  end

  def create_changeset(attrs) do
    %Movie{}
    |> cast(attrs, [:uuid, :cast, :genres, :title, :year])
    |> validate_required([:title, :year])
  end
end
