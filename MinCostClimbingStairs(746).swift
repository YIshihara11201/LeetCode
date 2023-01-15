class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        let top = cost.count
        var dp = [Int](repeating: 1001, count: top+1) // costs to reach idx'x step

        dp[0] = 0
        dp[1] = 0
        dp[2] = min(cost[0], cost[1])

        if top > 2 {    
            for i in 3...top {
                dp[i] = min(cost[i-1]+dp[i-1], cost[i-2]+dp[i-2])
            }
        }

        return dp[top]
    }
}
