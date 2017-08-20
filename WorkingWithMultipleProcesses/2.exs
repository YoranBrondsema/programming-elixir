defmodule WorkingWithMultipleProcesses do
  def process(sender, token) do
    :timer.sleep 500 * :rand.uniform(2)
    send sender, token
  end
end

spawn(WorkingWithMultipleProcesses, :process, [self(), "fred"])
spawn(WorkingWithMultipleProcesses, :process, [self(), "betty"])

receive do
  token -> IO.puts token
end

receive do
  token -> IO.puts token
end
