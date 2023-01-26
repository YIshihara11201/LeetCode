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
        var res: TreeNode? = nil
        var queue = Queue<TreeNode>()
        queue.enqueue(item: root!)
        while !queue.isEmpty {
            let curr = queue.dequeue()
            if helper(curr, p!.val) && helper(curr, q!.val) {
                res = curr
            }

            if curr?.left != nil {
                queue.enqueue(item: curr!.left!)
            }
            if curr?.right != nil {
                queue.enqueue(item: curr!.right!)
            }
        }

        return res
    }

    func helper(_ root: TreeNode?, _ target: Int) -> Bool {
        if root == nil {
            return false
        }
        
        if root!.val == target {
            return true
        }

        if root!.val > target {
            return helper(root!.left, target)
        } else {
            return helper(root!.right, target)
        }
        
    }
}

struct Queue<T> {
    var q: [T] = []
    var isEmpty: Bool {
        return q.count == 0
    }

    mutating func enqueue(item: T) {
        q.append(item)
    }

    mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        }

        return q.removeFirst()
    }

    func peek() -> T? {
        if isEmpty {
            return nil
        }

        return q[0]
    }
}
