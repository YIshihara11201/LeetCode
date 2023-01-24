/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var children: [Node]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.children = []
 *     }
 * }
 */

class Solution {
    func preorder(_ root: Node?) -> [Int] {
    	var res: [Int] = []
        helper(root, &res)
        
        return res
    }

    func helper(_ root: Node?, _ res: inout [Int]) {
        guard let root = root else { return }

        res.append(root.val)
        for n in root.children {
            helper(n, &res)
        }
    }
}
