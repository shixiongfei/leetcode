// 两数相加
// https://leetcode-cn.com/problems/add-two-numbers/description/

type ListNode = { value: int; next: option<ListNode> }

let reverseList (list: option<ListNode>) =
    let rec reverseListHelper (head: option<ListNode>) (current: option<ListNode>) (preNode: option<ListNode>) =
        match current with
        | None -> head
        | Some(l) ->
            let next = l.next
            let newNode = { value = l.value; next = preNode }

            reverseListHelper (Some newNode) next (Some newNode)

    reverseListHelper list list None

let addTwoNumbers (list1: ListNode) (list2: ListNode) =
    let rec addTwoNumbersHelper (total: option<ListNode>) (carry: int) (l1: option<ListNode>) (l2: option<ListNode>) =
        match (carry, l1, l2) with
        | (0, None, None) -> reverseList total
        | _ ->
            let (n1, l1Next) =
                match l1 with
                | None -> (0, None)
                | Some(l) -> (l.value, l.next)

            let (n2, l2Next) =
                match l2 with
                | None -> (0, None)
                | Some(l) -> (l.value, l.next)

            let s = n1 + n2 + carry
            let x = { value = s % 10; next = total }

            addTwoNumbersHelper (Some x) (s / 10) l1Next l2Next

    addTwoNumbersHelper None 0 (Some list1) (Some list2)
