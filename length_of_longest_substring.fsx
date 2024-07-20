// 无重复字符的最长子串
// https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/description/

open System
open System.Collections.Generic

let most fn lst =
    let rec innerIter rest wins higher =
        match rest with
        | [] -> (wins, higher)
        | x :: xs ->
            let score = fn x

            if score > higher then
                innerIter xs x score
            else
                innerIter xs wins higher

    if lst = [] then
        ([], 0)
    else
        innerIter (List.tail lst) (List.head lst) (fn (List.head lst))

let charInList lst ch = List.exists (fun x -> x = ch) lst

let lengthOfLongestSubstring (s: string) : int =
    let rec innerIter lst str =
        match str with
        | "" -> List.rev lst
        | _ when charInList lst (str.[0]) -> List.rev lst
        | _ -> innerIter (str.[0] :: lst) (str.Substring(1))

    let rec outerIter checkList str =
        if str = "" then
            let (wins, higher) = most List.length (List.rev checkList)
            higher
        else
            outerIter ((innerIter [] str) :: checkList) (str.Substring(1))

    outerIter [] s
