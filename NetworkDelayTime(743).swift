class Solution {
    func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
		var distance = [Int](repeating: Int.max, count: n+1)
		var check = [Bool](repeating: false, count: n+1)
		
		var adjList = [[(v: Int, w: Int)]](repeating: [(Int, Int)](), count: n+1)
		for time in times {
			adjList[time[0]].append((v: time[1], w: time[2]))
		}
		
		distance[k] = 0
        for _ in 1...n-1 {
            var minWeight = Int.max
            var minVertex = 1
            for v in 1...n {
                if !check[v] && distance[v]<minWeight {
                    minWeight = distance[v]
                    minVertex = v
                }
            }
            
            check[minVertex] = true

            for edge in adjList[minVertex] {
                if edge.w == Int.max {
                    continue
                }
                if distance[edge.v] > distance[minVertex] + edge.w {
                    distance[edge.v] = distance[minVertex] + edge.w
                }
            } 
        }
		
        print(check)
        print(distance)
        if distance[1...check.count-1].contains(Int.max) {
            return -1
        }
        
        let res = distance[1...check.count-1].max()!
        return res
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
