defmodule ListsAndRecursion do
  def max([ head | tail ]), do: _max(tail, head)

  defp _max([], curmax), do: curmax
  defp _max([ head | tail ], curmax) when head > curmax, do: _max(tail, head)
  defp _max([ _ | tail ], curmax), do: _max(tail, curmax)
end
