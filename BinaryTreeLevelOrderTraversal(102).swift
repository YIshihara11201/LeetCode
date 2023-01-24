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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return []
        }
        
        var res: [[Int]] = []
        var level: [Int] = []
        var queue = Queue<(TreeNode, Int)>()

        queue.enqueue(item: (root!, 1))
        while !queue.isEmpty {
            let curr = queue.dequeue()!
            let currNode = curr.0
            let currLevel = curr.1

            if res.count < currLevel {
                res.append([currNode.val])
            } else {
                res[currLevel-1].append(currNode.val)
            }
            
            if currNode.left != nil {
                queue.enqueue(item: (currNode.left!, currLevel+1))
            }
            if currNode.right != nil {
                queue.enqueue(item: (currNode.right!, currLevel+1))
            }
        }

        return res
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
        if q.count>0 {
            return q.removeFirst()
        }
        return nil
    }

    func peek() -> T? {
        if q.count == 0 {
            return nil
        }
        return q[0]
    }
}
