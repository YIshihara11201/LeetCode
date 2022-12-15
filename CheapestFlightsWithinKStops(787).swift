class Solution {
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
        var d = [Int](repeating: Int.max, count: n)
        d[src] = 0
        
        for i in 0...k {
            var tmp = d
            for flight in flights {
                let u = flight[0]
                let v = flight[1]
                let w = flight[2]
                if d[u] == Int.max {
                    continue
                }
                
                tmp[v] = min(tmp[v], d[u] + w)
                
            }
            d = tmp
        }
        
        return d[dst]==Int.max ? -1: d[dst]
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
