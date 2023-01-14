class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var res = nums[0]
        var accum = [Int](repeating: 0, count: nums.count)
        accum[0] = nums[0]

        for i in 1..<nums.count {
            if accum[i-1] >= 0 {
                accum[i] = nums[i] + accum[i-1]
            } else {
                accum[i] = nums[i]
            }

            if res < accum[i] {
                res = accum[i]
            }
        }

        return res
    }
}
