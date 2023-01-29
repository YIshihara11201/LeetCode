class Solution {
	func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
		var memo = [Int](repeating: 0, count: s.count+1)
		var set = Set<String>(wordDict)
		return helper(idx: 0, s: s, wordDict: wordDict, S: &set, memo: &memo)
	}

	func helper(idx: Int, s: String, wordDict: [String], S: inout Set<String>, memo: inout [Int]) -> Bool {
		if idx == s.count {
			return true
		}
		
		if memo[idx] != 0 {
			if memo[idx] == 1 {
				return true
			} else if memo[idx] == -1 {
				return false
			}
		}
		
		for end in idx..<s.count {
			let subStr = s[s.index(s.startIndex, offsetBy: idx)...s.index(s.startIndex, offsetBy: end)]
			if S.contains(String(subStr)) && helper(idx: end+1, s: s, wordDict: wordDict, S: &S, memo: &memo) {
				memo[idx] = 1
				return true
			}
		}
		
		memo[idx] = -1
		return false
	}
}
