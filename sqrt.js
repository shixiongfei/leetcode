// x 的平方根
// https://leetcode-cn.com/problems/sqrtx/description

/**
 * @param {number} x
 * @return {number}
 */
var mySqrt = function (x) {
  let sqrt_iter = function (low, up) {
    let mid = (low + up) / 2
    let m2 = mid * mid

    if (Math.abs(m2 - x) < 0.00001) {
      return mid
    }

    if (m2 < x) {
      return sqrt_iter(mid + 1, up)
    }

    return sqrt_iter(low, mid - 1)
  }
  return Math.floor(sqrt_iter(0, x))
}
