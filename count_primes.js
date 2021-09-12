// 计数质数
// https://leetcode-cn.com/problems/count-primes/description

/**
 * @param {number} n
 * @return {number}
 */
var countPrimes = function (n) {
  let primes = new Array(n + 1)

  primes[0] = 0
  primes[1] = 0
  primes[n] = 0

  for (let i = 2; i < n; ++i) primes[i] = 1

  for (let i = 0; i <= n; ++i)
    if (primes[i] > 0)
      if (i * i < n)
        for (let j = i; j <= Math.floor(n / i); ++j) primes[j * i] = 0

  return primes.reduce((a, b) => a + b, 0)
}
