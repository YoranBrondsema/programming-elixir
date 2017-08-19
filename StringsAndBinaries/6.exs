defmodule StringsAndBinaries do
  def capitalize_sentences(s) do
    String.split(s, ". ")
    |> Enum.map(&String.capitalize/1)
    |> Enum.join(". ")
  end
end

IO.inspect StringsAndBinaries.capitalize_sentences("oh. a DOG. woof. ")
