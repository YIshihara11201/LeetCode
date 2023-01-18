class Solution {
    func matrixReshape(_ mat: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
        if r*c != mat.count*mat[0].count {
            return mat
        }

        var currR = 0
        var currC = 0
        var res = [[Int]](repeating: [Int](repeating: 0, count: c), count: r)

        for i in 0..<mat.count {
            for j in 0..<mat[0].count {
                if currC == c {
                    currR += 1
                    currC = 0
                }
                res[currR][currC] = mat[i][j]
                currC += 1
            }
        }

        return res
    }
}
