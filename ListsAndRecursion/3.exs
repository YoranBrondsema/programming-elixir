defmodule ListsAndRecursion do
  def caesar([], _), do: []
  def caesar([ head | tail ], n) do
    [ rem(head - ?a + n, (?z - ?a)) + ?a | caesar(tail, n) ]
  end
end
