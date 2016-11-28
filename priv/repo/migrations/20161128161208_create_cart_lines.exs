defmodule EventSourcing.Repo.Migrations.CreateCartLines do
  use Ecto.Migration

  def change do
    create table(:cart_lines, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :quantity, :integer
      add :product_id, references(:products, type: :uuid)
      add :visitor_id, references(:visitors, type: :uuid)
    end
  end
end
