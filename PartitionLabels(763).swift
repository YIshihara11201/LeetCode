class Solution {
    func partitionLabels(_ s: String) -> [Int] {
	
        var alphabetDict = [Character: [Int]]()
        for char in s {
            if alphabetDict[char] == nil {
                alphabetDict[char] = [s.firstIndex(of: char)!.utf16Offset(in: s), s.lastIndex(of: char)!.utf16Offset(in: s)]
            }
        }

        let sortedAlphabetDict = alphabetDict.sorted(by: { $0.value[0]<$1.value[0] })
        print(sortedAlphabetDict)
        var res = [Int]()

        let currAlphabet = sortedAlphabetDict[0]
        var start = currAlphabet.value[0]
        var end = currAlphabet.value[1]

        for i in 1..<sortedAlphabetDict.count {
            let currAlphabet = sortedAlphabetDict[i]
            if currAlphabet.value[0]>start && currAlphabet.value[0]<end && currAlphabet.value[1]>end {
                end = currAlphabet.value[1]
            } else if currAlphabet.value[0]>end {
                res.append(end-start+1)
                start = currAlphabet.value[0]
                end = currAlphabet.value[1]
            }
        }
        res.append(end-start+1)

        return res
    }

}
