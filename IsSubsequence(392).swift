class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        if s.count == 0 {
            return true
        }
        
        let sArr = Array(s)
        let tArr = Array(t)
        var currIdx = 0
        for i in 0..<tArr.count {
            if tArr[i] == sArr[currIdx] {
                currIdx += 1
                if currIdx == sArr.count {
                    return true
                }
            }
        }
        
        return false
    }
}
