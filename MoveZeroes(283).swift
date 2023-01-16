class Solution {
	func moveZeroes(_ nums: inout [Int]) {
		var zeroIdx = -1
		
		for i in 0..<nums.count {
			if nums[i] == 0 {
				if zeroIdx == -1 {
					zeroIdx = i
				}
			} else if zeroIdx != -1 {
				nums[zeroIdx] = nums[i]
				nums[i] = 0
				zeroIdx += 1
			}
		}
	}
}
