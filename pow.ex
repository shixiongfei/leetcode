# Pow(x, n)
# https://leetcode-cn.com/problems/powx-n/description

defmodule Solution do
  @spec my_pow(x :: float, n :: integer) :: float
  def my_pow(x, n) do
    my_pow(x, n, 1)
  end

  defp my_pow(_, 0, accum) do
    accum
  end

  defp my_pow(x, n, _) when n < 0 do
    my_pow(1 / x, -n, 1)
  end

  defp my_pow(x, n, accum) when rem(n, 2) == 0 do
    my_pow(x * x, div(n, 2), accum)
  end

  defp my_pow(x, n, accum) do
    my_pow(x, n - 1, accum * x)
  end
end
