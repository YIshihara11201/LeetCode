class Solution {
    func numDecodings(_ s: String) -> Int {
        
        let n = s.count
        var dp = [Int](repeating: 0 , count: n+1)
        
        if Int(s[0, 1])! == 0 {
            return 0
        }
        
        dp[0] = 1
        dp[1] = 1

        if s.count == 1 {
            return dp[n]
        }
        
        for i in 2...n {
            if Int(s[i-1, i])! >= 1 && Int(s[i-1, i])! <= 9 {
                dp[i] += dp[i-1]
            }
            if Int(s[i-2, i])! >= 10 && Int(s[i-2, i])! <= 26 {
                dp[i] += dp[i-2]
            }
        }
        
        return dp[n]
    }
}

extension String {
	subscript(index: Int) -> String {
		get {
			return String(self[self.index(startIndex, offsetBy: index)])
		}
		set {
			let startIndex = self.index(self.startIndex, offsetBy: index)
			self = self.replacingCharacters(in: startIndex..<self.index(after: startIndex), with: newValue)
		}
	}
	
	subscript(start: Int, end: Int) -> String {
		get {
			let startIndex = self.index(self.startIndex, offsetBy: start)
			let endIndex = self.index(self.startIndex, offsetBy: end)
			return String(self[startIndex..<endIndex])
		}
		set {
			let startIndex = self.index(self.startIndex, offsetBy: start)
			let endIndex = self.index(self.startIndex, offsetBy: end)
			self = self.replacingCharacters(in: startIndex..<endIndex, with: newValue)
		}
	}
}
