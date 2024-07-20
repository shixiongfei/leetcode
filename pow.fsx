// Pow(x, n)
// https://leetcode-cn.com/problems/powx-n/description

let myPow1 (x: float) (n: int) =
    let rec myPowHelper accum x n =
        if n = 0 then accum
        elif (n % 2) = 0 then myPowHelper accum (x * x) (n / 2)
        elif n < 0 then myPowHelper 1.0 (1.0 / x) -n
        else myPowHelper (accum * x) x (n - 1)

    myPowHelper 1.0 x n

let myPow2 (x: float) (n: int) =
    let rec myPowHelper accum x n =
        match n with
        | _ when n = 0 -> accum
        | _ when (n % 2) = 0 -> myPowHelper accum (x * x) (n / 2)
        | _ when n < 0 -> myPowHelper 1.0 (1.0 / x) -n
        | _ -> myPowHelper (accum * x) x (n - 1)

    myPowHelper 1.0 x n
