/**
 * Definition for singly-linked list.
 * function ListNode(val, next) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.next = (next===undefined ? null : next)
 * }
 */
/**
 * @param {ListNode} head
 * @return {ListNode}
 */
var sortList = function(head) {
    if(head==null||head.next==null) return head;
    
    let left = head;
    let right = middleNode(head);
    let tmp = right.next;
    right.next = null;
    right = tmp;
    
    left = sortList(left);
    right = sortList(right);

    return merge(left, right);
};

const middleNode = (head)=> {
    let fast = head.next;
    let slow = head;
    while(fast!=null&&fast.next!=null){
        fast = fast.next.next;
        slow = slow.next;
    }
    return slow;
}

const merge = (left, right)=>{
    let dummy = new ListNode(null, null);
    let head = dummy;
    
    while(left!=null&&right!=null){
        if(left.val<right.val){
            head.next = left;
            left = left.next;
        }else{
            head.next = right;
            right = right.next;
        }
        head = head.next;
    }
    
    if(left!=null) head.next = left;
    else if (right!=null) head.next = right;
    
    return dummy.next;
}
