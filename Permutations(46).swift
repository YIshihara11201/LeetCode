class Solution {
	func permute(_ nums: [Int]) -> [[Int]] {
		var res: [[Int]] = []
		let n = nums.count
		helper(nums: nums, start: 0, end: n, curr: [], res: &res)

		return res
	}

	func helper(nums: [Int], start: Int, end: Int, curr: [Int], res: inout [[Int]]) {
		if start == end {
			res.append(curr)
			return
		}

		for i in 0...curr.count {
			var newCurr = curr
			newCurr.insert(nums[start], at: i)
			helper(nums: nums, start: start+1, end: end, curr: newCurr, res: &res)
		}
	}
}
