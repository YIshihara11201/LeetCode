class Solution {
	func deleteAndEarn(_ nums: [Int]) -> Int {
		var points = [Int](repeating: 0, count: 10000+1)
		for num in nums {
			points[num] += num
		}

		var memo = [Int](repeating: -1, count: points.count)
		memo[0] = 0
		memo[1] = points[1]
		
		return helper(&memo, points, points.count-1)
	}

	func helper(_ memo: inout [Int], _ points: [Int], _ currIdx: Int) -> Int {
		if currIdx <= 0{
			return memo[0]
		}
		if currIdx == 1 {
			return memo[1]
		}

		if memo[currIdx] == -1 {
			memo[currIdx] = max(points[currIdx] + helper(&memo, points, currIdx-2), helper(&memo, points, currIdx-1))
		}
		
		return memo[currIdx]
	}
}
