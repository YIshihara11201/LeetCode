class Solution {
    func jump(_ nums: [Int]) -> Int {
        // number of steps to reach an index
        var dp = [Int](repeating: 10001, count: nums.count)
        dp[0] = 0
        for i in 1..<nums.count {
            var j = 1
            while i-j>=0 && j<=1000 {            
                if nums[i-j] >= j && dp[i-j] != 10001{
                    dp[i] = dp[i-j]+1
                }
                j += 1
            }            
        }
        return dp[nums.count-1]
    }
}
