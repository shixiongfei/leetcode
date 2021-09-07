// 两数之和
// https://leetcode-cn.com/problems/two-sum/description/

#include <stdlib.h>

/**
 * Note: The returned array must be malloced, assume caller calls free().
 */
int* twoSum(int* nums, int numsSize, int target) {
    int i, j;
    for (i = 0; i < numsSize; ++i) {
        for (j = i + 1; j < numsSize; ++j) {
            if (target == (nums[i] + nums[j])) {
                int *retval = (int *)malloc(sizeof(int) * 2);
                retval[0] = i;
                retval[1] = j;
                return retval;
            }
        }
    }
    return NULL;
}
