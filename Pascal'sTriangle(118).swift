class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        if numRows == 1 {
            return [[1]]
        }
        if numRows == 2 {
            return [[1], [1, 1]]
        }

        var res: [[Int]] = []
        res.append([1])
        res.append([1, 1])

        for i in 3...numRows {
            res.append([Int](repeating: 0, count: i))
            res[i-1][0] = 1
            res[i-1][i-1] = 1
            for j in 1..<i-1 {
                res[i-1][j] = res[i-2][j-1] + res[i-2][j]
            }
        }

        return res
    }
}
