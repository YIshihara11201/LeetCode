**
 * Definition for singly-linked list.
 * function ListNode(val, next) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.next = (next===undefined ? null : next)
 * }
 */
/**
 * @param {ListNode} l1
 * @param {ListNode} l2
 * @return {ListNode}
 */
var addTwoNumbers = function(l1, l2) {
    let res = new ListNode();
    let dummy = res;
    
    let carry = 0;
    while(l1!=null&&l2!=null) {
        if(l1.val+l2.val+carry>=10) {
            dummy.next = new ListNode(l1.val+l2.val+carry-10);
            carry = 1;
        } else {
            dummy.next = new ListNode(l1.val+l2.val+carry);
            carry = 0;
        }
            
        dummy = dummy.next;
        l1 = l1.next;
        l2 = l2.next;
    }

    if(l1!=null) {        
        while(l1!=null){
            if(l1.val+carry>=10){
                dummy.next = new ListNode(l1.val+carry-10, null);
                carry = 1;
            }else {
                dummy.next = new ListNode(l1.val+carry, null);
                carry = 0;
            }
            dummy = dummy.next;
            l1 = l1.next;
        }
    }else if(l2!=null) {        
        while(l2!=null){
            if(l2.val+carry>=10){
                dummy.next = new ListNode(l2.val+carry-10, null);
                carry = 1;
            }else {
                dummy.next = new ListNode(l2.val+carry, null);
                carry = 0;
            }
            dummy = dummy.next;
            l2 = l2.next;
        }
    }
    
    if(carry==1) dummy.next = new ListNode(1,null);


    return res.next;
};
