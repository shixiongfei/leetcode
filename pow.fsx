// Pow(x, n)
// https://leetcode-cn.com/problems/powx-n/description

let myPow (x: float) (n: int) =
    let rec myPowHelper accum x n =
        if n = 0 then accum
        elif (n % 2) = 0 then myPowHelper accum (x * x) (n / 2)
        elif n < 0 then myPowHelper 1.0 (1.0 / x) -n
        else myPowHelper (accum * x) x (n - 1)

    myPowHelper 1.0 x n
