defmodule ListsAndRecursion do
  def all?([], _), do: true
  def all?([ head | tail ], f), do: f.(head) and all?(tail, f)

  def each([], _), do: :ok
  def each([ head | tail ], f) do
    f.(head)
    each(tail, f)
  end

  def filter([], _), do: []
  def filter([ head | tail ], f) do
    if f.(head) do
      [ head | filter(tail, f) ]
    else
      filter(tail, f)
    end
  end

  def split(l, n) when n >= 0, do: _split(l, n, [])
  def split(l, n), do: _split(l, length(l) + n, [])
  defp _split(l, n, _) when n < 0, do: { [], l }
  defp _split(l, 0, split), do: { split, l }
  defp _split([], _, split), do: { split, [] }
  defp _split([ head | tail ], n, split) do
    _split(tail, n - 1, split ++ [head])
  end

  def take([], _), do: []
  def take(l, 0), do: []
  def take([ head | tail ], n) do
    [ head | take(tail, n - 1) ]
  end
end
