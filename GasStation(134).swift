class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        let n = gas.count
	    var diff = [Int](repeating: 0, count: n)
	    for i in 0..<n {
	    	diff[i] = gas[i]-cost[i]
	    }
	
	    if diff.reduce(0) {$0+$1} < 0 {
            return -1
        }
        
        var res = 0
        var currIndex = 0
        while currIndex < n {
            var currEnergy = diff[currIndex]
            if currEnergy <= 0 {
                currIndex += 1
                continue
            }
            
            var j=(currIndex+1)%n
            while j != currIndex {
                currEnergy = currEnergy+diff[j]
                if currEnergy >= 0 {
                    j = (j+1)%n
                } else {
                    currIndex = j+1
                    break
                }
            }
            if j==currIndex {
                res = currIndex
                break
            }
        }
        
        return res
    }
}
