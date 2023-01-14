class Solution {
	func maxSubArray(_ nums: [Int]) -> Int {
		return helper(nums, 0, nums.count-1)
	}

	func helper(_ nums: [Int], _ left: Int, _ right: Int) -> Int {
		if left > right {
			return Int.min
		}
		
		let mid = (left+right)/2
		var leftSum = 0
		var rightSum = 0
		   
		var currSum = 0
		if mid-1 >= left {
			for i in (left...mid-1).reversed() {
				currSum += nums[i]
				leftSum = max(leftSum, currSum)
			}
		}
		
		currSum = 0
		if mid+1 <= right {
			for i in (mid+1)...right {
				currSum += nums[i]
				rightSum = max(rightSum, currSum)
			}
		}
	
	   return max(nums[mid]+leftSum+rightSum, helper(nums, left, mid-1), helper(nums, mid+1, right))
	}
}
