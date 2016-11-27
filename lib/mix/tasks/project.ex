defmodule Mix.Tasks.Project do
  use Mix.Task
  import Ecto.Query, only: [from: 2]
  alias EventSourcing.Event
  alias EventSourcing.Product
  alias EventSourcing.ProductProjecter
  alias EventSourcing.Repo

  @shortdoc "Generate the projection of all events"

  def run(_) do
    Mix.Task.run "app.start", []

    Repo.delete_all(Product)

    query = from e in Event, order_by: e.timestamp

    Repo.all(query)
    |> Enum.each(&ProductProjecter.apply(&1.type, &1.payload))
  end
end