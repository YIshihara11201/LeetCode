/**
 * Definition for a binary tree node.
 * function TreeNode(val, left, right) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.left = (left===undefined ? null : left)
 *     this.right = (right===undefined ? null : right)
 * }
 */
/**
 * @param {TreeNode} root
 * @return {number[][]}
 */
var levelOrder = function(root) {
    if(root==null) return [];
    
    let res = [];
    let queue = [root];
    
    while(queue.length!=0){
        let level = [];
        
        let len = queue.length;
        for(let i=0; i<len; i++){
            let poppedNode = queue.shift();
            if(poppedNode.left!=null) queue.push(poppedNode.left);
            if(poppedNode.right!=null) queue.push(poppedNode.right);
            level.push(poppedNode.val);
        }
        res.push(level);
        
    }
    
    return res;
};
