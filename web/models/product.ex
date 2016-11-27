defmodule EventSourcing.Product do
  use EventSourcing.Web, :model

  @primary_key {:id, :binary_id, autogenerate: false}

  schema "products" do
    field :name, :string
    field :price, :integer
    field :stock, :integer
  end

  def changeset(product, params \\ %{}) do
    product
    |> cast(params, [:name, :price, :stock])
  end
end
