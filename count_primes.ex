# 计数质数
# https://leetcode-cn.com/problems/count-primes/description

defmodule Solution do
  @spec count_primes(n :: integer) :: integer
  def count_primes(n) do
    count_primes(n, 0, 2, %{n => true})
  end

  defp mark_notprimes(step, not_primes, q) when step > q do
    not_primes
  end

  defp mark_notprimes(step, not_primes, q) do
    step..q
    |> Enum.reduce(not_primes, fn i, m -> Map.put(m, step * i, true) end)
  end

  defp count_primes(n, count, step, _) when step > n do
    count
  end

  defp count_primes(n, count, step, not_primes) do
    if Map.has_key?(not_primes, step) do
      count_primes(n, count, step + 1, not_primes)
    else
      count_primes(n, count + 1, step + 1, mark_notprimes(step, not_primes, div(n, step)))
    end
  end
end
