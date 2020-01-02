defmodule ElixirProject.Repo.Migrations.MoviesMigration do
  use Ecto.Migration

  def change do
    create table(:movies, primary_key: false) do
      add(:uuid, :binary_id, primary_key: true)
      add(:genres, {:array, :string})
      add(:cast, {:array, :string})
      add(:title, :string)
      add(:year, :int)
    end
  end
end
