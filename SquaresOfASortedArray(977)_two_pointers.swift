class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var res = [Int](repeating: -1, count: nums.count)

        var left = 0
        var right = nums.count-1

        for i in 0..<nums.count {
            if abs(nums[left]) <= abs(nums[right]) {
                res[nums.count-1-i] = nums[right]*nums[right]
                right -= 1
            } else {
                res[nums.count-1-i] = nums[left]*nums[left]
                left += 1
            }
        }

        return res
    }
}
