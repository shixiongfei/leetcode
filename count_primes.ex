# 计数质数
# https://leetcode-cn.com/problems/count-primes/description

defmodule Solution do
  @spec count_primes(n :: integer) :: integer
  def count_primes(n) do
    Enum.filter(0..(n - 1), &is_prime/1) |> length
  end

  defp is_prime(2), do: true
  defp is_prime(n) when n < 2 or rem(n, 2) == 0, do: false
  defp is_prime(n), do: is_prime(n, 3)

  defp is_prime(n, k) when n < k * k, do: true
  defp is_prime(n, k) when rem(n, k) == 0, do: false
  defp is_prime(n, k), do: is_prime(n, k + 2)
end
