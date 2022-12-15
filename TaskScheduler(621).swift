class Solution {
   func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        var map = [Character: Int]()
        for i in 0..<tasks.count {
            map[tasks[i], default: 0] += 1
        }

        var res = 0 // for total tasks done including idle state
        var remainingCharCount = tasks.count
        while map.filter({ $0.value>0 }).count > 0 {
            var count = n+1
            for (key, value) in map.sorted(by: { $0.value > $1.value }) {
                if value > 0 {
                    map[key]! -= 1
                    remainingCharCount -= 1
                }

                count -= 1
                res += 1
                if count == 0 || remainingCharCount == 0{
                    break
                }
            }
            if remainingCharCount > 0 {
                res += count
            }
        }

        return res
    }
}
