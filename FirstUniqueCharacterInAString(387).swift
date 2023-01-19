class Solution {
	func firstUniqChar(_ s: String) -> Int {
		let sArr = Array(s)
		var occurances = [Int](repeating: 0, count: 26)
		for i in 0..<s.count {
			occurances[Int(sArr[i].asciiValue!)-97] += 1
		}

		print(occurances)
		
		var res = -1
		for i in 0..<sArr.count {
			if occurances[Int(sArr[i].asciiValue!)-97] == 1 {
				res = i
				break
			}
		}

		return res
	}
}
