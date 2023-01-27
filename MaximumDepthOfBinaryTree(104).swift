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
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }

        var queue = Queue<(TreeNode, Int)>()
        var depth = 1
        queue.enqueue(item: (root!, depth))
        while !queue.isEmpty {
            let curr = queue.dequeue()!
            let currNode = curr.0
            let currDepth = curr.1
            depth = currDepth
            if currNode.left != nil {
                queue.enqueue(item: (currNode.left!, currDepth+1))
            }
            if currNode.right != nil {
                queue.enqueue(item: (currNode.right!, currDepth+1))
            }
        }

        return depth
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
        if q.isEmpty {
            return nil
        }
        return q.removeFirst()
    }
}
