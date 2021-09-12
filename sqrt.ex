# x 的平方根
# https://leetcode-cn.com/problems/sqrtx/description

defmodule Solution do
  @spec my_sqrt(x :: integer) :: integer
  def my_sqrt(x) do
    if x <= 1 do
      x
    else
      my_sqrt(x, 0, x)
    end
  end

  defp my_sqrt(x, low, high) do
    mid = (low + high) / 2
    m2 = mid * mid

    cond do
      abs(m2 - x) < 0.00001 -> trunc(mid)
      m2 < x -> my_sqrt(x, mid + 1, high)
      true -> my_sqrt(x, low, mid - 1)
    end
  end
end
