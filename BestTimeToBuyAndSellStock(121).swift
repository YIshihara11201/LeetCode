class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.count == 1 {
            return 0
        }

        var res = 0
        var left = 0
        for right in 1..<prices.count {
            if prices[right]-prices[left] < 0 {
                left = right
            } else if prices[right]-prices[left] > res {
                res = prices[right]-prices[left]
            }
        }

        return res
    }
}
