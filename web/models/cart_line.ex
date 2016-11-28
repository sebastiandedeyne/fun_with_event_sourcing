defmodule EventSourcing.CartLine do
  use EventSourcing.Web, :model

  schema "cart_lines" do
    field :quantity, :integer
    belongs_to :visitor, EventSourcing.Visitor
    belongs_to :product, EventSourcing.Product
  end
end
