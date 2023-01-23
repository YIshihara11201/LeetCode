class Solution {
	func maxSubarraySumCircular(_ nums: [Int]) -> Int {
        let n = nums.count

        var rightMax = [Int](repeating: -30001, count: n)
        rightMax[n-1] = nums[n-1]
        var suffixSum = nums[n-1]
        for i in (0..<n-1).reversed() {
            suffixSum += nums[i]
            rightMax[i] = max(rightMax[i+1], suffixSum)
        }

        var specialSum = nums[0]
        var maxSum = nums[0]
        var prefixSum = 0
        var currMax = 0
        for i in 0..<n {
            currMax = max(currMax, 0) + nums[i]
            maxSum = max(maxSum, currMax)

            prefixSum += nums[i]
            if i+2 < n {
                specialSum = max(specialSum, prefixSum + rightMax[i+2])
            }
        }
        return max(maxSum, specialSum)
	}
}
