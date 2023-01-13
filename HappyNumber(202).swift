class Solution {
	func isHappy(_ n: Int) -> Bool {
		var res = true
		var usedNum: [Int] = []

		var curr = n
		while(true) {
			curr = sum(curr)
			if usedNum.firstIndex(of: curr) != nil {
				res = false
				break
			} else {
				usedNum.append(curr)
				if curr == 1 {
					break
				}
			}
		}

		return res
	}

	func sum(_ n: Int) -> Int {
		var res = 0
		var curr = n
		while(curr>0) {
			res += (curr%10)*(curr%10)
			curr /= 10
		}

		return res
	}
}
