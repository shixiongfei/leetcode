// 计数质数
// https://leetcode-cn.com/problems/count-primes/description

let isPrime n =
    let rec isPrimeHelper n k =
        if n < (k * k) then true
        elif (n % k) = 0 then false
        else isPrimeHelper n (k + 2)

    match n with
    | 2 -> true
    | _ when n < 2 || (n % 2) = 0 -> false
    | _ -> isPrimeHelper n 3

let countPrimes (n: int) =
    List.filter isPrime [ 0 .. (n - 1) ] |> List.length
