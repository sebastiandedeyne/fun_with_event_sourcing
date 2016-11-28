defmodule EventSourcing.VisitorProjector do
  alias EventSourcing.Repo
  alias EventSourcing.Visitor

  def apply(:visitor_started_a_new_session, %{id: id}) do
    Repo.insert! %Visitor{id: id}
  end

  def apply(_, _), do: nil
end