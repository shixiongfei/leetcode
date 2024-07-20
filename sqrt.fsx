// x 的平方根
// https://leetcode-cn.com/problems/sqrtx/description

let mySqrt (x: int) =
    let rec mySqrtHelper low high =
        let mid = (low + high) / 2.0
        let m2 = mid * mid

        if (abs (m2 - (float x))) < 1e-7 then floor (mid + 1e-7)
        elif m2 < x then mySqrtHelper (mid + 1.0) high
        else mySqrtHelper low (mid - 1.0)

    if x <= 1 then x else (int (mySqrtHelper 0.0 (float x)))
