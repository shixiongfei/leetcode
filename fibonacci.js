// 斐波那契数
// https://leetcode-cn.com/problems/fibonacci-number/

/**
 * @param {number} n
 * @return {number}
 */
var fib = function (n) {
  var a = 0
  var b = 1
  var c = 0

  while (n > 0) {
    c = a
    a = a + b
    b = c
    n = n - 1
  }

  return a
}
