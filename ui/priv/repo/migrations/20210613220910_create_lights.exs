defmodule HomeControlUi.Repo.Migrations.CreateLights do
  use Ecto.Migration

  def change do
    create table(:lights) do
      add :name, :string
      add :is_on, :boolean, default: false, null: false

      timestamps()
    end

  end
end
