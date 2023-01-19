class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        let row = 9
        let col = row

        var s = Set<Character>()
        // row check
        for i in 0..<row {
            for j in 0..<col {
                let curr = board[i][j]
                if curr != "." && s.contains(curr) {
                    return false
                }
                s.insert(curr)
            }
            s.removeAll()
        }

        //col check
        for i in 0..<row {
            for j in 0..<col {
                let curr = board[j][i]
                if curr != "." && s.contains(curr) {
                    return false
                }
                s.insert(curr)
            }
            s.removeAll()
        }

        // 3*3 squares check
        for squareRowIdx in 0..<3 {
            for squareColIdx in 0..<3 {
                s.removeAll()
                for r in 3*squareRowIdx..<3*(squareRowIdx+1) {
                    for c in 3*squareColIdx..<3*(squareColIdx+1) {
                        let curr = board[r][c]
                        if curr != "." && s.contains(curr) {
                            return false
                        }
                        s.insert(curr)
                    }
                }
            }
        }

        return true
    }
}
