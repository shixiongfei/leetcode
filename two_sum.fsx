// 两数之和
// https://leetcode-cn.com/problems/two-sum/description/

let twoSum (nums: int list) (target: int) =
    let rec twoSumHelper hashes nums index =
        match nums with
        | [] -> [ -1; -1 ]
        | head :: tail ->
            if Map.containsKey head hashes then
                [ Map.find head hashes; index ]
            else
                twoSumHelper (Map.add (target - head) index hashes) tail (index + 1)

    twoSumHelper Map.empty nums 0
