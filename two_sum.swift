// 两数之和
// https://leetcode-cn.com/problems/two-sum/description/

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict: [Int: Int] = [:]

        for i in 0..<nums.count {
            let num = nums[i]

            if dict.keys.contains(num) {
                return [dict[num]!, i]
            }

            dict[target - num] = i
        }
        return []
    }
}
