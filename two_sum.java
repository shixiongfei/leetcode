// 两数之和
// https://leetcode-cn.com/problems/two-sum/description/

class Solution {
    public int[] twoSum(int[] nums, int target) {
        for (int i = 0; i < nums.length; ++i) {
            for (int j = i + 1; j < nums.length; ++j) {
                if (target == (nums[i] + nums[j])) {
                    int[] retval = new int[2];
                    retval[0] = i;
                    retval[1] = j;
                    return retval;
                }
            }
        }
        return null;
    }
}
