defmodule EventSourcing.EventPayload do
    @behaviour Ecto.Type
    def type, do: :string

    def cast(value), do: {:ok, value}

    def load(value), do: {:ok, keys_to_atoms(value)}

    def dump(value), do: {:ok, keys_to_atoms(value)}

    defp keys_to_atoms(map) do
      for {key, val} <- map, into: %{} do
        {String.to_atom(key), val}
      end
    end
  end