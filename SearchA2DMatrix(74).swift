class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let row = matrix.count
        let col = matrix[0].count
        var oneDArr = [Int](repeating: 0, count: row*col)

        for i in 0..<row {
            for j in 0..<col {
                oneDArr[i*col+j] = matrix[i][j]
            }
        }

        var left = 0
        var right = oneDArr.count-1
        while left<=right {
            let mid = (left+right)/2
            if oneDArr[mid] == target {
                return true
            } else if oneDArr[mid] < target {
                left = mid+1
            } else {
                right = mid-1
            }
        }

        return false
    }
}
