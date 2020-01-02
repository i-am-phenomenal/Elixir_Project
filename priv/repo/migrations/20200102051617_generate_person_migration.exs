defmodule ElixirProject.Repo.Migrations.GeneratePersonMigration do
  use Ecto.Migration

  def change do
    create table(:people, primary_key: false) do
      add(:uuid, :binary_id, primary_key: true)
      add(:first_name, :string, null: false)
      add(:last_name, :string, null: false)
      add(:email, :string, null: false)
      add(:password, :string, null: false)
      timestamps()
    end
  end
end
