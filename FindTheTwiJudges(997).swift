class Solution {
    func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
        var adjList = [[Int]](repeating: [], count: n+1)
        
        for row in trust {
            let first = row.first!
            let last = row.last!
            adjList[first].append(last)
        }
        
        var possiblePerson = -1
        for u in 1...n {
            if adjList[u].count == 0 {
                possiblePerson = u
                break
            }
        }
        
        if possiblePerson == -1 {
            return -1
        }
        
        for (u, row) in adjList.enumerated() {
            if u == possiblePerson || u == 0 {
                continue
            }
            if !row.contains(possiblePerson) {
                return -1
            }
        }
        
        return possiblePerson
    }
}
