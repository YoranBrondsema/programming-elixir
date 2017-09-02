defmodule Stack.Server do
  use GenServer

  def start(stack) do
    GenServer.start_link(__MODULE__, stack, name: __MODULE__)
  end

  def push(el) do
    GenServer.cast(__MODULE__, { :push, el })
  end

  def pop do
    GenServer.call(__MODULE__, :pop)
  end

  def handle_call(:pop, _from, [ top | rest]) do
    { :reply, top, rest }
  end

  def handle_cast({:push, el}, stack) do
    { :noreply, [ el | stack] }
  end

  def terminate(reason, _state) do
    IO.puts "Terminated for reason:"
    IO.inspect reason
    :ok
  end
end
