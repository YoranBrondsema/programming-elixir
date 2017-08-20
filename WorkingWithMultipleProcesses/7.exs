defmodule Parallel do
  def pmap(collection, fun) do
    me = self()

    collection
    |> Enum.map(fn (elem) ->
        spawn_link fn ->
          :timer.sleep 100 * :rand.uniform(2)
          send me, { self(), fun.(elem) }
        end
      end)
    |> Enum.map(fn (_pid) ->
        receive do
          { _pid, result } ->
            IO.inspect result
            result
        end
      end)
  end
end

Parallel.pmap 1..10, &(&1 * &1)
# |> IO.inspect
