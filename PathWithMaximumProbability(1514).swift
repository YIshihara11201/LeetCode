class Solution {
    func maxProbability(_ n: Int, _ edges: [[Int]], _ succProb: [Double], _ start: Int, _ end: Int) -> Double {
        var adjList = [[(v: Int, w: Double)]](repeating: [(v: Int, w: Double)](), count: n)
        for i in 0..<edges.count {
            let u = edges[i][0]
            let v = edges[i][1]
            let w = succProb[i]
            adjList[u].append((v: v, w: w))
            adjList[v].append((v: u, w: w))
        }
        
        var prob = [Double](repeating: -Double.infinity, count: n)
        var check = [Bool](repeating: false, count: n)
        prob[start] = 1
        
        for _ in 0..<n-1 {
            var minWeight = -Double.infinity
            var minVertex = 1
            for v in 0..<n {
                if !check[v] && prob[v] > minWeight {
                    minWeight = prob[v]
                    minVertex = v
                }
            }
            
            check[minVertex] = true
            for edge in adjList[minVertex] {
                if prob[minVertex] == 1 {
                    prob[edge.v] = prob[minVertex] * edge.w
                } else {
                    if prob[edge.v] < prob[minVertex] * edge.w {
                        prob[edge.v] = prob[minVertex] * edge.w
                    }
                }
            }
        }
        
        print(prob)
        
        if prob[end] == -Double.infinity {
            return 0
        }
        
        return abs(prob[end])
    }
}

extension String {
	subscript(index: Int) -> String {
		get {
			return String(self[self.index(startIndex, offsetBy: index)])
		}
		set {
			let startIndex = self.index(self.startIndex, offsetBy: index)
			self = self.replacingCharacters(in: startIndex..<self.index(after: startIndex), with: newValue)
		}
	}
	
	subscript(start: Int, end: Int) -> String {
		get {
			let startIndex = self.index(self.startIndex, offsetBy: start)
			let endIndex = self.index(self.startIndex, offsetBy: end)
			return String(self[startIndex..<endIndex])
		}
		set {
			let startIndex = self.index(self.startIndex, offsetBy: start)
			let endIndex = self.index(self.startIndex, offsetBy: end)
			self = self.replacingCharacters(in: startIndex..<endIndex, with: newValue)
		}
	}
}
