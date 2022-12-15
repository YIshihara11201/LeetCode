/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        
        // get nodes to shift starting node for search
        func getNodes(root: TreeNode?, nodes: inout [TreeNode]) {
            if root == nil {
                return
            }
            nodes.append(root!)
            getNodes(root: root!.left, nodes: &nodes)
            getNodes(root: root!.right, nodes: &nodes)
        }
        
        func pathLength(start: TreeNode?, count: Int, target: TreeNode) -> Int? {
            guard let start = start else { 
                return nil
            }
            if start.val == target.val {
                return count
            }
            if let leftNode = start.left, leftNode.val == target.val {
                return count+1
            } 
            if let rightNode = start.right, rightNode.val == target.val {
                return count+1
            }
            
            let left = pathLength(start: start.left, count: count+1, target: target) 
            let right = pathLength(start: start.right, count: count+1, target: target)
            
            return left != nil ? left : right
        }
        
        var nodes = [TreeNode]()
        getNodes(root: root, nodes: &nodes)        
        
        var res: TreeNode? = nil
        var minDistance = Int.max
            
        // cases for either p or q is the ancestor of the other
        if pathLength(start: p!, count: 0, target: p!) == 0
        && pathLength(start: p!, count: 0, target: q!) != nil {
                return p!
        }
        if pathLength(start: q!, count: 0, target: q!) == 0
        && pathLength(start: q!, count: 0, target: p!) != nil {
                return q!
        }
        
        for node in nodes {
            if let dist1 = pathLength(start: node, count: 0, target: p!),
            let dist2 = pathLength(start: node, count: 0, target: q!) {
                if dist1 != nil && dist2 != nil {
                    if dist1+dist2 < minDistance {
                        minDistance = dist1+dist2
                        res = node
                    }
                }
            }
        }
        
        return res
    }
    
}
