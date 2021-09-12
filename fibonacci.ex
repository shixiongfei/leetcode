# 斐波那契数
# https://leetcode-cn.com/problems/fibonacci-number/

defmodule Solution do
  @spec fib(n :: integer) :: integer
  def fib(n) do
    fib(0, 1, n)
  end

  defp fib(a, _, 0) do
    a
  end

  defp fib(a, b, step) do
    fib(a + b, a, step - 1)
  end
end
