defmodule StringsAndBinaries do
  def calculate(s), do: _calculate(s, [], nil)

  defp _calculate([operator | rest], left, nil) when operator == ?+ or operator == ?- or operator == ?* or operator == ?/ do
    _calculate(rest, left, operator)
  end
  defp _calculate([space | rest], left, nil) when space == ?\s do
    _calculate(rest, left, nil)
  end
  defp _calculate([ space | right], left, operator) when space == ?\s do
    _apply(to_integer(left), to_integer(right), operator)
  end
  defp _calculate([ digit | rest], left, nil) do
    _calculate(rest, left ++ [digit], nil)
  end

  defp _apply(left, right, ?+), do: left + right
  defp _apply(left, right, ?-), do: left - right
  defp _apply(left, right, ?*), do: left * right
  defp _apply(left, right, ?/), do: left / right

  def to_integer(l) do
    Enum.reduce(l, 0, fn(x, acc) -> 10 * acc + x - ?0 end)
  end
end

IO.inspect StringsAndBinaries.calculate('123 + 28')
