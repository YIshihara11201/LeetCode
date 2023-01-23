class Solution {
	func maxScoreSightseeingPair(_ values: [Int]) -> Int {
		var maximum = values[0]+0
        var res = 0
        
        for i in 1..<values.count {
            maximum = max(maximum, values[i-1]+i-1)
            res = max(res, maximum+values[i]-i)
        }

        return res
	}
}
