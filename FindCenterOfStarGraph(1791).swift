class Solution {
    func findCenter(_ edges: [[Int]]) -> Int {
        var map:[Int: Int] = [:]
        
        for edge in edges {
            let u = edge[edge.index(edge.startIndex, offsetBy:0)]
            let v = edge[edge.index(edge.startIndex, offsetBy:1)]
            map[u, default: 0] += 1
            map[v, default: 0] += 1
        }
        
        var res = -1
        for (key, value) in map {
            if value == edges.count {
                res = key
            }
        }
        
        return res
    }
}
