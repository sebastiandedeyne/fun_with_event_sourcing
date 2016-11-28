defmodule EventSourcing.Product do
  use EventSourcing.Web, :model

  schema "products" do
    field :name, :string
    field :price, :integer
    field :stock, :integer
  end

  def changeset(product, params \\ %{}) do
    product
    |> cast(params, [:name, :price, :stock])
    |> validate_required([:name, :price, :stock])
  end
end
