defmodule ListsAndRecursion do
  def flatten([]), do: []
  def flatten([ head | tail ]) do
    flatten(head) ++ flatten(tail)
  end
  def flatten(el), do: [el]
end
