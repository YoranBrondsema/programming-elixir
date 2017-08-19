defmodule StringsAndBinaries do
  def is_printable([]), do: true
  def is_printable([ c | tail]) when c >= ?\s and c <= ?~ do
    is_printable(tail)
  end
  def is_printable(_), do: false
end
