class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var dict: [Int: Int] = [:]

        for num in nums {
            if dict[num] == nil {
                dict[num] = 1
            } else {
                dict[num]! += 1
            }
        }

        return dict.filter { $0.value == 1 }.first!.key
    }
}
