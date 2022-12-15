class Solution {
    func judgeSquareSum(_ c: Int) -> Bool {
        var map = Set<Int>()
	
        for i in 0...Int(sqrt(Double(c))) {
            map.insert(i*i)
        }
        
        for item in map {
            if map.contains(c-item) {
                return true
            }
        }

        return false
    }
}
