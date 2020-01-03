defmodule ElixirProject.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field(:message, :string)
    field(:name, :string)

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:name, :message])
    |> validate_required([:name, :message])
  end

  @doc false
  def get_all_messages(limit) do
    ElixirProject.Repo.all(ElixirProject.Message, limit: limit)
  end
end
