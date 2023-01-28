class Solution {
	func permute(_ nums: [Int]) -> [[Int]] {
        var res: [[Int]] = [[nums[0]]]
        var idx = 1
        while idx < nums.count {
            var newRes: [[Int]] = []
            for i in 0..<res.count {
                var currP = res[i]
                for j in 0...currP.count {
                    var newP = currP
			        newP.insert(nums[idx], at: j)
                    newRes.append(newP)
                }
            }
            res = newRes
            idx += 1
        }
        
		return res
	}
}
