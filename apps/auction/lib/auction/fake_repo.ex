defmodule Auction.FakeRepo do
    alias Auction.Item

    @items [
        %Item{
            id: 1,
            title: "first Item",
            description: "A tasty Item sure to please",
            ends_at: ~N[2020-10-20 12:12:12]
        },
        %Item{
            id: 2,
            title: "second Item",
            description: "Meow",
            ends_at: ~N[2020-10-20 12:12:12]
        },
        %Item{
            id: 3,
            title: "third Item",
            description: "OMG WHAT IS THIS ITEM?",
            ends_at: ~N[2020-10-20 12:12:12]
        },
    ]

    def all(Item), do: @items

    def get!(Item, id) do
        Enum.find(@items, fn(item) -> item.id === id end)
    end

@doc """
In the Items table for each Item check each key passed in attrs if matching item has matching key return true
"""
    def get_by(Item, attrs) do
        Enum.find(@items, fn(item) -> 
            Enum.all?(Map.keys(attrs), fn(key) ->
                Map.get(item, key) === attrs[key]
            end)
        end)
    end
end