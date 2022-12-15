/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */

/**
 * @param {ListNode} headA
 * @param {ListNode} headB
 * @return {ListNode}
 */
var getIntersectionNode = function(headA, headB) {
    let lenA = listLen(headA);
    let lenB = listLen(headB);
    
    if(lenA<lenB){
        headB = trimList(lenB-lenA, headB);
        
    } else if (lenA>lenB) {
        headA = trimList(lenA-lenB, headA);
    }
    
    while(headA!=null&&headB!=null) {
        if(headA==headB) return headA;
        headA = headA.next;
        headB = headB.next;
    }
    
    return null;
};

const listLen = (head)=> {
    let iterator = head;
    let count = 0;
    while(iterator!=null){
        iterator = iterator.next;
        count++;
    }
    return count;
}

const trimList = (count, list)=> {
    while(count>0){
        list = list.next;
        count--;
    }
    return list;
}
