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
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
       if head == nil {
           return nil
       }

       var currVal = head!.val
       var currNode = head
       var dummy = ListNode()
       var res = dummy
       while currNode?.next != nil {
           if currNode!.next!.val != currVal {
               res.next = currNode
               res = res.next!
               currVal = currNode!.next!.val
           }
           currNode = currNode?.next
       }
       res.next = currNode

       return dummy.next
    }
}
