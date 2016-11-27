defmodule EventSourcing.ProductProjecter do
  alias EventSourcing.Repo
  alias EventSourcing.Product
  
  def apply(:product_was_added_to_catalog, %{id: _, name: _, price: _, stock: _} = product) do
    Repo.insert! struct(Product, product)
  end

  def apply(:product_price_was_updated, %{product_id: product_id, price: price}) do
    Repo.get!(Product, product_id)
    |> Product.changeset(%{price: price})
    |> Repo.update!
  end

  def apply(:product_was_purchased, %{product_id: product_id, amount: amount}) do
    product = Repo.get! Product, product_id
    Repo.update! Product.changeset(product, %{stock: product.stock - amount})
  end
end