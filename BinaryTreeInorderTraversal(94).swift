/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var res: [Int] = []
        helper(root, res: &res)

        return res
    }

    func helper(_ root: TreeNode?, res: inout[Int]) {
        if let root = root {
            helper(root.left, res: &res)
            res.append(root.val)
            helper(root.right, res: &res)
        }

        return
    }

}
