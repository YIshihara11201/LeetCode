/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head
        while fast != nil && fast?.next != nil {
            slow = slow!.next
            fast = fast!.next!.next
            if slow === fast { 
                var h = head
                while h !== slow {
                    h = h!.next
                    slow = slow!.next
                }
                return h
            }
        }
    
        return nil
    }
}
