/**
 * Definition for singly-linked list.
 * function ListNode(val, next) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.next = (next===undefined ? null : next)
 * }
 */
/**
 * @param {ListNode} head
 * @return {boolean}
 */
var isPalindrome = function(head) {
    let middle = middleNode(head);
    let reversedHalf = reverse(middle.next);
    while(reversedHalf != null) {
        if (head.val != reversedHalf.val) return false;
        head = head.next;
        reversedHalf = reversedHalf.next;
    }
    
    return true;
};

const middleNode = (node)=> {
    let slow = node;
    let fast = node.next;
    
    while(fast!=null && fast.next!=null) {
        slow = slow.next;
        fast = fast.next.next;
    }
    
    return slow;
}

const reverse = (node)=> {
    let cur = node;
    let prev = null;
    let next = null;
    
    while(cur != null){
          next = cur.next;
          cur.next = prev;
          prev = cur;
          cur = next;
    }
    
    return prev;
}
