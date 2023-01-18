class Solution {
	func rob(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums[0]
        }
		let res1 = helper(nums, start: 0, end: nums.count-2)
		let res2 = helper(nums, start: 1, end: nums.count-1)
		return max(res1, res2)
	}

	func helper(_ nums: [Int], start: Int, end: Int) -> Int { // from House Robber I
		if end < start {
			return nums[start]
		}

		let s = nums.index(nums.startIndex, offsetBy: start)
		let e = nums.index(nums.startIndex, offsetBy: end)

		let newNums = Array(nums[s...e])
		var memo = [Int](repeating: 0, count: newNums.count+1)
		memo[0] = 0
		memo[1] = newNums[0]
			
		if newNums.count > 1 {
			
			for i in 2...newNums.count {
				memo[i] = max(memo[i-1], memo[i-2]+newNums[i-1])
			}
		}

		return memo[newNums.count]
	}
}
