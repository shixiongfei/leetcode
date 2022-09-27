// 两整数之和
// https://leetcode-cn.com/problems/sum-of-two-integers/

class Solution {
    func getSum(_ a: Int, _ b: Int) -> Int {
        var (sum, carry) = (a ^ b, (a & b) << 1)

        while (carry != 0) {
            (sum, carry) = (sum ^ carry, (sum & carry) << 1)
        }
        return sum
    }
}
