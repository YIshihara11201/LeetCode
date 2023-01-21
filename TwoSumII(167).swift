class Solution {
	func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
		var res = [Int](repeating: -1001, count: 2)
		
		var found = false
		for i in 0..<numbers.count-1 {
			var left = i+1
			var right = numbers.count-1
			while left <= right {
				let mid = (left+right)/2
				if numbers[mid] == target-numbers[i] {
					res[0] = i+1
					res[1] = mid+1
					found = true
					break
				} else if numbers[mid] < target-numbers[i] {
					left = mid+1
				} else {
					right = mid-1
				}
			}
			if found {
				break
			}
		}
		
		return res
	}
}
