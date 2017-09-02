defmodule Client do
  @name :root_of_ring

  def start do
    pid = spawn(__MODULE__, :receiver, [nil])

    root = :global.whereis_name @name
    if root == :undefined do
      :global.register_name(@name, pid)
      send pid, { :tick }
    else
      send root, { :join, pid }
    end
  end

  # We're the last client in the ring
  def receiver(nil) do
    receive do
      { :join, pid } ->
        receiver(pid)

      { :tick } ->
        IO.puts "tick in client #{inspect self()}"
        :timer.sleep 2000
        root = :global.whereis_name @name
        send root, { :tick }
        receiver(nil)
    end
  end

  # We're in the middle of the ring
  def receiver(next) do
    receive do
      { :join, pid } ->
        send next, { :join, pid }
        receiver(next)

      { :tick } ->
        IO.puts "tick in client #{inspect self()}"
        :timer.sleep 2000
        send next, { :tick }
        receiver(next)
    end
  end
end
