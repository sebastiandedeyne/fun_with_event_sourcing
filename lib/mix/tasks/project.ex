defmodule Mix.Tasks.Project do
  use Mix.Task
  import Ecto.Query, only: [from: 2]
  alias EventSourcing.Event
  alias EventSourcing.Repo

  @shortdoc "Generate the projection of all events"

  def run(_) do
    Mix.Task.run "app.start", []

    clear_projections

    query = from e in Event, order_by: e.sequence

    Repo.all(query)
    |> Enum.each(&apply_event(&1))
  end

  def clear_projections do
    Repo.delete_all(EventSourcing.Product)
    Repo.delete_all(EventSourcing.Visitor)
    Repo.delete_all(EventSourcing.CartLine)
  end

  def apply_event(%Event{type: type, payload: payload}) do
    EventSourcing.ProductProjector.apply(type, payload)
    EventSourcing.VisitorProjector.apply(type, payload)
    EventSourcing.CartProjector.apply(type, payload)
  end
end