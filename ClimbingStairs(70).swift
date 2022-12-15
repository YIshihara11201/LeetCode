class Solution {
    func climbStairs(_ n: Int) -> Int {
        var d = [Int](repeating: -1, count: 45+1)
        d[0] = 1
        d[1] = 1

        if n<2 {
            return d[n]
        }

        for i in 2..<n+1 {
            d[i] = d[i-1] + d[i-2]
        }

        return d[n]
    }
}
