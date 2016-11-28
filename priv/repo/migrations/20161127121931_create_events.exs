defmodule EventSourcing.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :sequence, :serial
      add :type, :string
      add :payload, :map
      add :timestamp, :datetime
    end
  end
end
