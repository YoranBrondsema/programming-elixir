defmodule WorkingWithMultipleProcesses do
  def process(parent) do
    send parent, "Hello!"
    exit :normal
  end

  def receive_messages do
    receive do
      message ->
        IO.puts "#{inspect message}"
        receive_messages()
    end
  end

  def run do
    spawn_link(WorkingWithMultipleProcesses, :process, [self()])

    :timer.sleep 500

    receive_messages()
  end
end

WorkingWithMultipleProcesses.run
