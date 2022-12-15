class Solution {
	func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
		var adj = [[Int]](repeating: [Int](), count: numCourses)
		
		for i in 0 ..< prerequisites.count {
			let edge = prerequisites[i]
			let u = edge[1]
			let v = edge[0]
			
			adj[u].append(v)
		}
        
        while true {
            // list for vertices with inward arrows
            var verticesWithInwardArrows = adj.filter { $0.count != 0 }.flatMap { $0 }
            // list for vertices without inward arrows
            var verticesOnlyWithOutwardArrows = [Int]()
            for v in 0..<numCourses {
                if !verticesWithInwardArrows.contains(v) && adj[v].count != 0 {
                    verticesOnlyWithOutwardArrows.append(v)
                }
            }
            
            if verticesOnlyWithOutwardArrows.count == 0 {
                break
            }
            
            // remove edges for vertices of no incoming arrows
            for v in verticesOnlyWithOutwardArrows {
                adj[v].removeAll()
            }
        }
        
        for edge in adj {
            if edge.count != 0 {
                return false
            }
        }
        
        return true
	}
}
