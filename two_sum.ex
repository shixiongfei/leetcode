# 两数之和
# https://leetcode-cn.com/problems/two-sum/description/

defmodule Solution do
  @spec two_sum(nums :: [integer], target :: integer) :: [integer]
  def two_sum(nums, target) do
    two_sum(%{}, nums, 0, target)
  end

  defp two_sum(_, [], _, _) do
    [-1, -1]
  end

  defp two_sum(hashes, [head | tail], index, target) do
    if Map.has_key?(hashes, head) do
      [Map.get(hashes, head), index]
    else
      two_sum(Map.put(hashes, target - head, index), tail, index + 1, target)
    end
  end
end
