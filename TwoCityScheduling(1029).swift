class Solution {
    func twoCitySchedCost(_ costs: [[Int]]) -> Int {
        let sortedCostsByDiff = costs.sorted(by:  {abs($0[0]-$0[1]) > abs($1[0]-$1[1])} )
	let n = sortedCostsByDiff.count/2
	var a = [Int]()
	var b = [Int]()
	
	for i in 0..<sortedCostsByDiff.count {
		if sortedCostsByDiff[i][0] < sortedCostsByDiff[i][1] {
			if a.count<n {
				a.append(sortedCostsByDiff[i][0])
			} else {
				b.append(sortedCostsByDiff[i][1])
			}
		} else {
			if b.count<n {
				b.append(sortedCostsByDiff[i][1])
			} else {
				a.append(sortedCostsByDiff[i][0])
			}
		}
	}
	
	var res = a.reduce(0) {$0+$1} + b.reduce(0) {$0+$1}
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
