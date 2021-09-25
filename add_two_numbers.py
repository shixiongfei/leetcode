# 两数相加
# https://leetcode-cn.com/problems/add-two-numbers/description/

# Definition for singly-linked list.
class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None

class Solution:
    def addTwoNumbers(self, l1: ListNode, l2: ListNode) -> ListNode:
        total = None
        carry = 0
        list1 = l1
        list2 = l2

        while carry != 0 or list1 or list2:
            n1 = list1.val if list1 else 0
            n2 = list2.val if list2 else 0
            s = n1 + n2 + carry
            carry = s // 10

            b = ListNode(s % 10)
            b.next = total
            total = b

            list1 = list1.next if list1 else None
            list2 = list2.next if list2 else None

        reverse = None
        while total:
            temp = total.next
            total.next = reverse
            reverse = total
            total = temp
        return reverse
