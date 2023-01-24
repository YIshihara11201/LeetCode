class Solution {
	func longestPalindrome(_ s: String) -> Int {
		var dict: [Character: Int] = [:]
		var sArr = Array(s)
		for i in 0..<sArr.count {
			if dict[sArr[i]] == nil {
				dict[sArr[i]] = 1
			} else {
				dict[sArr[i]]! += 1
			}
		}

		var res = 0
		var odd = 0
		for (_, value) in dict {
			if value%2 == 0 {
				res += value
			} else {
                if value>2 {
                    res += (value-1)
                }
                odd = 1
            }
		}
		
		return res+odd
	}
}
