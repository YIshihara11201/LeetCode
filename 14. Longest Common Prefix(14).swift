class Solution {
	func longestCommonPrefix(_ strs: [String]) -> String {
		let strs = strs.sorted(by: {
			$0.count < $1.count
		})
        var res: String = ""
		let s = strs[0]

		for i in 0..<s.count {
			let currIdx = s.index(s.startIndex, offsetBy: i)
			let curr = s[...currIdx]
			
			var isPrefix = true
			for j in 1..<strs.count {
				let cmp = strs[j]
				if cmp[...currIdx] != curr {
					isPrefix = false
					break
				}
			}
			if isPrefix {
				res = String(curr)
			} else {
				break
			}
		}

		return res
	}
}
