defmodule EventSourcing.CartProjector do
  alias EventSourcing.Repo
  alias EventSourcing.CartLine

  def apply(:visitor_added_a_product_to_their_cart, %{id: id, visitor_id: visitor_id, product_id: product_id, quantity: quantity}) do
    Repo.insert! %CartLine{id: id, visitor_id: visitor_id, product_id: product_id, quantity: quantity}
  end

  def apply(_, _), do: nil
end