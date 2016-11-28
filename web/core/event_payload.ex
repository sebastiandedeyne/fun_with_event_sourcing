defmodule EventSourcing.EventPayload do
    @behaviour Ecto.Type
    def type, do: :string

    def cast(value), do: {:ok, value}

    def load(value), do: {:ok, keys_to_atoms(value)}

    def dump(value), do: {:ok, keys_to_atoms(value)}

    def keys_to_atoms(map) do
      for {key, val} <- map, into: %{} do
        if is_atom(key) do
          {key, val}
        else
          {String.to_atom(key), val}
        end
      end
    end
  end