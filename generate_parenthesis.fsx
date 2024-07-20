// 括号生成
// https://leetcode-cn.com/problems/generate-parentheses/description

open System.Collections.Generic

let generateParenthesis n : List<string> =
    let res = List<string>()

    let rec recur cur left right =
        if left = 0 && right = 0 then
            res.Add(cur) |> ignore
        else
            if left > 0 then
                recur (cur + "(") (left - 1) right

            if left < right then
                recur (cur + ")") left (right - 1)

    recur "" n n
    res
