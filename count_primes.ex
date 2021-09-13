# 计数质数
# https://leetcode-cn.com/problems/count-primes/description

defmodule Solution do
  @spec count_primes(n :: integer) :: integer
  def count_primes(n) do
    not_primes = :ets.new(:not_primes, [])
    :ets.insert(not_primes, {n, true})
    count_primes(n, 0, 2, not_primes)
  end

  defp mark_notprimes(step, not_primes, q) when step > q do
    :ok
  end

  defp mark_notprimes(step, not_primes, q) do
    step..q//2
    |> Enum.each(fn i -> :ets.insert(not_primes, {step * i, true}) end)
  end

  defp count_primes(n, count, step, _) when step > n do
    count
  end

  defp count_primes(n, count, step, not_primes) when step != 2 and rem(step, 2) == 0 do
    count_primes(n, count, step + 1, not_primes)
  end

  defp count_primes(n, count, step, not_primes) do
    case :ets.lookup(not_primes, step) do
      [_] ->
        count_primes(n, count, step + 1, not_primes)

      [] ->
        mark_notprimes(step, not_primes, div(n, step))
        count_primes(n, count + 1, step + 1, not_primes)
    end
  end
end
