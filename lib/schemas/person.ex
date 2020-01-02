defmodule ElixirProject.Schema.Person do
  use Ecto.Schema
  import Ecto.Changeset
  alias ElixirProject.Schema.Person

  @primary_key {:uuid, :binary_id, autogenerate: true}

  schema "people" do
    field(:first_name, :string)
    field(:last_name, :string)
    field(:email, :string)
    field(:password, :string)
    timestamps()
  end

  def create_changeset(attrs) do
    %Person{}
    |> cast(attrs, [:uuid, :first_name, :last_name, :email, :password])
    |> validate_required([:first_name, :email, :password])
  end
end
