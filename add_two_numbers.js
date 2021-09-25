// 两数相加
// https://leetcode-cn.com/problems/add-two-numbers/description/

/**
 * Definition for singly-linked list.
 */
function ListNode(val, next) {
  this.val = val === undefined ? 0 : val
  this.next = next === undefined ? null : next
}

/**
 * @param {ListNode} l1
 * @param {ListNode} l2
 * @return {ListNode}
 */
var addTwoNumbers = function (l1, l2) {
  let total = undefined
  let last = undefined
  let carry = 0

  while (l1 || l2 || carry > 0) {
    const v1 = l1 ? l1.val : 0
    const v2 = l2 ? l2.val : 0
    const sum = v1 + v2 + carry
    const node = new ListNode(sum % 10)

    if (!total) total = node

    if (last) last.next = node

    last = node

    carry = sum >= 10 ? 1 : 0
    l1 = l1 ? l1.next : null
    l2 = l2 ? l2.next : null
  }

  return total
}
