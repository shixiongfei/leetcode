// Pow(x, n)
// https://leetcode-cn.com/problems/powx-n/description

/**
 * @param {number} x
 * @param {number} n
 * @return {number}
 */
var myPow = function (x, n) {
  let pow_iter = function (x, n, acc) {
    if (n == 0) {
      return acc;
    }

    if (n % 2 == 0) {
      return pow_iter(x * x, n / 2, acc);
    }

    if (n < 0) {
      return pow_iter(1 / x, -n, 1);
    }

    return pow_iter(x, n - 1, acc * x);
  };

  return pow_iter(x, n, 1);
};
