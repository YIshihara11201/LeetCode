class Solution {
	func isIsomorphic(_ s: String, _ t: String) -> Bool {
		
		let sArr = Array(s)
		let tArr = Array(t)
		var dict1: [Character: Character] = [:]
		var dict2: [Character: Character] = [:]
		
		for i in 0..<sArr.count {
			// Using substring ends up in TLE
			// -> currIdx = s.index(s.startIndex, offsetBy: i)
			// -> use "s[currIdx]" instead of "sArr[i]"
			// what is the time complexity of "s[s.index(s.startIndex, offsetBy: X)]"?
			
			if dict1[sArr[i]] == nil && dict2[tArr[i]] == nil {
				dict1[sArr[i]] = tArr[i]
				dict2[tArr[i]] = sArr[i]
			} else if !(dict1[sArr[i]]==tArr[i] && dict2[tArr[i]] == sArr[i]) {
				return false
			}
		}
		return true
	}
}
