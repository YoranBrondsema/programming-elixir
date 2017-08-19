defmodule StringsAndBinaries do
  def center(words) do
    max = Enum.map(words, &String.length/1)
          |> Enum.max

    Enum.each(
      words,
      fn word ->
        space_count = div(max - String.length(word), 2)
        spaces = String.duplicate " ", space_count

        IO.puts "#{spaces}#{word}#{spaces}"
      end
    )
  end
end

StringsAndBinaries.center(["cat", "zebra", "elephant"])
