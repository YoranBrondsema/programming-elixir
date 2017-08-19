defmodule StringsAndBinaries do
  def anagram?(word1, word2) when length(word1) != length(word2), do: false
  def anagram?(word1, word2) do
    Enum.all?(
      word1,
      fn c ->
        length(Enum.filter(word1, &(&1 == c))) == length(Enum.filter(word2, &(&1 == c)))
      end
    )
  end
end

IO.inspect StringsAndBinaries.anagram?('aabc', 'baca')
