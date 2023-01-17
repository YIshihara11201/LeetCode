class Solution {

	func rob(_ nums: [Int]) -> Int {
		var memo = [Int](repeating: -1, count: nums.count)
		_ = helper(idx: 0, nums: nums, memo: &memo)
		return memo.sorted().last!
	}

	func helper(idx: Int, nums: [Int], memo: inout [Int]) -> Int {
		if idx >= nums.count {
			return 0
		}

		var res1: Int
		var res2: Int
		if idx+2 < nums.count && memo[idx+2] != -1 {
			res1 = nums[idx] + memo[idx+2]
		} else {
			res1 = nums[idx] + helper(idx: idx+2, nums: nums, memo: &memo)
		}
		
		if idx+1 < nums.count && memo[idx+1] != -1 {
			res2 = memo[idx+1]
		} else {
			res2 = helper(idx: idx+1, nums: nums, memo: &memo)
		}

		memo[idx] = max(res1, res2)
		return memo[idx]
	}
}
