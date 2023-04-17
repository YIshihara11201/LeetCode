class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        let n = nums.count
        var dict: [Int: Int] = [:]
        var res: Int!

        for num in nums {
            dict[num, default: 0] += 1
            guard let occurrence = dict[num] else { return -1 }
            if occurrence > n/2 {
                res = num
                break
            }
        }

        return res
    }
}
