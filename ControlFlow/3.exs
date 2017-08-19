defmodule ControlFlow do
  def ok!({:ok, data}), do: data
  def ok!({_, message}), do: raise "Failure with message #{message}"
end

ControlFlow.ok! File.open("somefile")
