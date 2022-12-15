class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var adj = [[Int]](repeating: [Int](), count: numCourses)
        var indegree = [Int](repeating: 0, count: numCourses)
        for i in 0 ..< prerequisites.count {
            let edge = prerequisites[i]
            let u = edge[1]
            let v = edge[0]

            adj[u].append(v)
            indegree[v] += 1
        }
        
        if !canFinish(numCourses, adj) {
            return []
        }
        
        var res = [Int]()

        var check = [Bool](repeating: false, count: numCourses)
        func dfs(start: Int) {
            if !check[start] {
                res.append(start)
                check[start] = true
            }
            for v in adj[start] {
                indegree[v] -= 1
                if indegree[v] == 0 {
                    dfs(start: v)
                }
            }
        }
        
        for start in 0..<numCourses {
            if indegree[start] == 0 && !check[start] {
                dfs(start: start)
            }
        }
        
        return res
    }
    
    
    func canFinish(_ numCourses: Int, _ graph: [[Int]]) -> Bool {
        var graph = graph
        while true {
            // list for vertices with inward arrows
            let verticesWithInwardArrows = graph.filter { $0.count != 0 }.flatMap { $0 }
            // list for vertices without inward arrows
            var verticesOnlyWithOutwardArrows = [Int]()
            for v in 0..<numCourses {
                if !verticesWithInwardArrows.contains(v) && graph[v].count != 0 {
                    verticesOnlyWithOutwardArrows.append(v)
                }
            }

            if verticesOnlyWithOutwardArrows.count == 0 {
                break
            }

            // remove edges for vertices of no incoming arrows
            for v in verticesOnlyWithOutwardArrows {
                graph[v].removeAll()
            }
        }

        for edge in graph {
            if edge.count != 0 {
                return false
            }
        }

        return true
    }

}
