defmodule ListsAndRecursion do
  def span(from, to) when from > to, do: []
  def span(from, to), do: [ from | span(from + 1, to) ]
end

dividors = fn n ->
  for x <- ListsAndRecursion.span(1, n), rem(n, x) == 0, do: x
end

primes = fn n ->
  for x <- ListsAndRecursion.span(2, n), length(dividors.(x)) == 2, do: x
end

IO.inspect primes.(100)
