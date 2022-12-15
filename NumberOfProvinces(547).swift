class Solution {
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        let n = isConnected.count
        var uf = UF(n)
        for i in 0..<n {
            var vertex = isConnected[i];
            for j in 0..<n {
                if(i != j && isConnected[i][j] == 1) {
                    uf.union(i, j)
                }
            }
        }
        
        return uf.count
    }
}

struct UF {
    private var parent: [Int]
    private var size: [Int]
    private(set) var count: Int
    
    public init(_ n: Int) {
        self.count = n
        self.size = [Int](repeating: 1, count: n)
        self.parent = [Int](repeating: 0, count: n)
        for i in 0..<n {
            self.parent[i] = i
        }
    }
    
    public mutating func find(_ p: Int) -> Int {
        var root = p
        while root != parent[root] {
            parent[root] = parent[parent[root]]
            root = parent[root]
        }
        return root
    }
    
    public mutating func union(_ p: Int, _ q: Int) {
        let rootP = find(p)
        let rootQ = find(q)
        
        if rootP == rootQ {
            return
        }
        
        if size[rootP] < size[rootQ] {
            parent[rootP] = rootQ
            size[rootQ] += size[rootP]
        } else {
            parent[rootQ] = rootP
            size[rootP] += size[rootQ]
        }
        
        count -= 1
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
