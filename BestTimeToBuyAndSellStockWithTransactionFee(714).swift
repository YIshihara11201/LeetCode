class Solution {
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        if prices.count == 0 {
            return 0
        }

        // maximum profit arrays under two conditions
        // -> own a stock at a day / doesn't own one
        var buy = [Int](repeating: 0, count: prices.count)
        var sell = [Int](repeating: 0, count: prices.count)
        buy[0] = -prices[0]-fee
        sell[0] = 0

        for i in 1..<prices.count {
            buy[i] = max(buy[i-1], sell[i-1]-prices[i]-fee)
            sell[i] = max(sell[i-1], buy[i-1]+prices[i])
        }

        return sell[prices.count-1]
    }
}
