class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        let ransomNoteArr = Array(ransomNote)
        let magazineArr = Array(magazine)
        var dict1: [Character: Int] = [:]
        var dict2: [Character: Int] = [:]

        for i in 0..<ransomNoteArr.count {
            if dict1[ransomNoteArr[i]] == nil {
                dict1[ransomNoteArr[i]] = 1
            } else {
                dict1[ransomNoteArr[i]]! += 1
            }
        }

        for i in 0..<magazineArr.count {
            if dict2[magazineArr[i]] == nil {
                dict2[magazineArr[i]] = 1
            } else {
                dict2[magazineArr[i]]! += 1
            }
        }

        for (key, value) in dict1 {
            guard let dict2 = dict2[key] else { return false }
            if dict2 < value {
                return false
            }
        }

        return true
    }
}
