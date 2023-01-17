class Solution {

	func rob(_ nums: [Int]) -> Int {
		//point: length of memo array is (nums' length + 1)
        var memo = [Int](repeating:0, count: nums.count+1)
        memo[0] = 0
        memo[1] = nums[0]

        if nums.count > 1 {
            for i in 2...nums.count {
                memo[i] = max(memo[i-1], memo[i-2]+nums[i-1])
            }
        }

		return memo[nums.count]
	}

}
