// 斐波那契数
// https://leetcode-cn.com/problems/fibonacci-number/

let fib (n: int) =
    let rec fibHelper a b step =
        if step <= 0 then a else fibHelper (a + b) a (step - 1)

    fibHelper 0 1 n
