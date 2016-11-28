alias EventSourcing.Repo
alias EventSourcing.Event

apple_id = "baa22856-0925-4c40-84d8-8c652adcfbe5"
pear_id = "b3a46fc2-0a91-46a8-892d-63dd9bb59f16"
mango_id = "eff80408-0121-4b39-a312-1d51e50fe11f"

visitor_id = "50cbf0fc-5cd0-4fa0-a857-786e42119fae"

cart_line_id = "bfc910e6-0105-491b-9163-177953377c3b"

events =
  [Event.new(:product_was_added_to_catalog, %{id: apple_id, name: "Apple", price: 1, stock: 100}),
   Event.new(:product_was_added_to_catalog, %{id: pear_id, name: "Pear", price: 1, stock: 100}),
   Event.new(:product_was_added_to_catalog, %{id: mango_id, name: "Mango", price: 1, stock: 100}),
   Event.new(:product_price_was_updated, %{product_id: mango_id, price: 2}),
   Event.new(:visitor_started_a_new_session, %{id: visitor_id}),
   Event.new(:visitor_added_a_product_to_their_cart, %{id: cart_line_id, visitor_id: visitor_id, product_id: apple_id, quantity: 1})]

Repo.delete_all(Event)
Enum.each(events, &Repo.insert!(&1))
