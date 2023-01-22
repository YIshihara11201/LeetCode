class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        if nums.count == 1 {
            return true
        }

        var dp = [Int](repeating: 0, count: nums.count+1)
        dp[0] = nums[0]
        for i in 1..<nums.count {
            if dp[i-1] == 0 {
                return false
            }
            dp[i] = max(dp[i-1]-1, nums[i])
        }

        return true
    }
}
