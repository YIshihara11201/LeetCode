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
    var res: [Int] = []
    var stack: ArrayStack<TreeNode> = ArrayStack<TreeNode>()

    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        stack.push(root)

        while(!stack.isEmpty) {
            let curr = stack.pop()!
            res.append(curr.val)

            if let right = curr.right {
                stack.push(right)
            }
            if let left = curr.left {
                stack.push(left)
            }
        }

       return res
    }
}

struct ArrayStack<T> {
    var items: [T] = []
    
    var isEmpty: Bool {  
		return items.isEmpty
	}

    mutating func push(_ item: T) {
        items.append(item)
    }

    mutating func pop()-> T? {
        items.popLast()
    }
}
