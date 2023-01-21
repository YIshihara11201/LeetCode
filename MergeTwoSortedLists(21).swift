/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var head1: ListNode? = list1
        var head2: ListNode? = list2
        var sentinel = ListNode()
        var res: ListNode = sentinel
        while head1 != nil && head2 != nil {
            if head1!.val < head2!.val {
                res.next = ListNode(head1!.val)
                head1 = head1!.next
            } else {
                res.next = ListNode(head2!.val)
                head2 = head2!.next
            }
            res = res.next!
        }

        if head1 != nil {
            res.next = head1!
        } else if head2 != nil {
            res.next = head2!
        }

        return sentinel.next
    }
}
