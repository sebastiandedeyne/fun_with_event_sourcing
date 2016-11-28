defmodule EventSourcing.Repo.Migrations.CreateSessions do
  use Ecto.Migration

  def change do
    create table(:visitors, primary_key: false) do
      add :id, :uuid, primary_key: true
    end
  end
end
