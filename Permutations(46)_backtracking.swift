class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var used = [Bool](repeating: false, count: nums.count)
        
        helper(nums: nums, P: [], used: &used, res: &res)
        return res
    }

    func helper(nums: [Int], P: [Int], used: inout[Bool], res: inout [[Int]]) {
        if P.count == nums.count {
            res.append(P)
            return
        }

        for i in 0..<nums.count {
           if used[i] {
                continue
            } else {
                var nextP = P
                nextP.append(nums[i])
                used[i] = true
                helper(nums: nums, P: nextP, used: &used, res: &res)
                used[i] = false
            }
        }
    }
}
