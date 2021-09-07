// 两数之和
// https://leetcode-cn.com/problems/two-sum/description/

/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number[]}
 */
var twoSum = function (nums, target) {
  let dict = {}

  for (let i in nums) {
    let num = nums[i]

    if (num in dict) {
      return [dict[num], i]
    }

    dict[target - num] = i
  }
}
