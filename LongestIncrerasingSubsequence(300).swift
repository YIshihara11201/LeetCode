class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        let n = nums.count
        var dp = [Int](repeating: 0, count: n)

        dp[0] = 1
        if n==1 { return dp[0] }

        for i in 1..<n {
            let currNum = nums[i]
            var length = 0
            var maxLenIdx = -1
            
            for j in 0..<i {
                if nums[j] < currNum && dp[j] > length {
                    maxLenIdx = j
                    length = dp[maxLenIdx]
                }
            }
            
            if maxLenIdx != -1 { 
                dp[i] = dp[maxLenIdx] + 1    
            } else {
                dp[i] = 1
            }
            
        }

        print(dp)
        return dp.max()!
    }
}
