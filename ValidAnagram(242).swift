class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        let sArr = Array(s)
        let tArr = Array(t)

        var cnt = [Int](repeating: 0, count: 26)
        for i in 0..<sArr.count {
            cnt[Int(sArr[i].asciiValue!)-97] += 1
        }

        for i in 0..<tArr.count {
            cnt[Int(tArr[i].asciiValue!)-97] -= 1
        }

        return cnt.filter { $0 != 0 }.count == 0
    }
}
