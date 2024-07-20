// 两整数之和
// https://leetcode-cn.com/problems/sum-of-two-integers/

let getSum (a: int) (b: int) =
    let mutable A = (uint32 a)
    let mutable B = (uint32 b)

    while B <> 0u do
        let sum = A ^^^ B
        let carry = (A &&& B) <<< 1

        A <- sum
        B <- carry

    if A < 0x80000000u then (int A) else -(int ((~~~A) + 1u))
