// 两整数之和
// https://leetcode-cn.com/problems/sum-of-two-integers/

/**
 * @param {number} a
 * @param {number} b
 * @return {number}
 */
var getSum = function (a, b) {
  var A = a
  var B = b

  while (B != 0) {
    var sum = A ^ B
    var carry = (A & B) << 1

    A = sum
    B = carry
  }

  // 正数直接返回, 负数需要还原补码
  return A < 0x80000000 ? A : -(~A + 1)
}
