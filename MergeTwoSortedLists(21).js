/**
 * Definition for singly-linked list.
 * function ListNode(val, next) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.next = (next===undefined ? null : next)
 * }
 */
/**
 * @param {ListNode} list1
 * @param {ListNode} list2
 * @return {ListNode}
 */
var mergeTwoLists = function(list1, list2) {
    let dummy = new ListNode();
    let head = dummy;
    
    while(list1!=null&&list2!=null) {
        head.next = new ListNode();
        head = head.next;
        if(list1.val<list2.val) {
            head.val = list1.val;
            list1 = list1.next;
        } else {
            head.val = list2.val;
            list2 = list2.next;
        }
    }
    
    if(list1==null&&list2!=null) {
        head.next = list2;
    } else if(list1!=null&&list2==null) {
        head.next = list1;
    }
    
    return dummy.next;
};
