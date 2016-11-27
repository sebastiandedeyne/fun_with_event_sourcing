defmodule EventSourcing.Event do
  use EventSourcing.Web, :model

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "events" do
    field :type, EventSourcing.EventType
    field :payload, EventSourcing.EventPayload
    field :timestamp, Ecto.DateTime
  end

  def new(type, payload \\ %{}) do
    %__MODULE__{type: type,
                payload: payload,
                timestamp: Ecto.DateTime.utc}
  end
end
