defmodule Stack.Server do
  use GenServer

  def start_link(stash_pid) do
    { :ok, _pid } = GenServer.start_link(__MODULE__, stash_pid, name: __MODULE__)
  end

  def push(el) do
    GenServer.cast(__MODULE__, { :push, el })
  end

  def pop do
    GenServer.call(__MODULE__, :pop)
  end

  def explode do
    1 + []
  end

  def init(stash_pid) do
    current_stack = Stack.Stash.get_stack stash_pid
    { :ok, { current_stack, stash_pid } }
  end

  def handle_call(:pop, _from, { [top | rest], stash_pid }) do
    { :reply, top, { rest, stash_pid } }
  end

  def handle_cast({:push, el}, {stack, stash_pid}) do
    { :noreply, {[ el | stack], stash_pid} }
  end

  def terminate(_reason, { current_stack, stash_pid }) do
    Stack.Stash.save_stack stash_pid, current_stack
  end
end
