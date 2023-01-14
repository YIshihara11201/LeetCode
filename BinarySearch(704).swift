class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        return helper(nums, 0, nums.count-1, target)
    }

    func helper(_ nums: [Int], _ left: Int, _ right: Int, _ target: Int) -> Int {
        if left > right {
            return -1
        }
        
        let mid = (left+right)/2
        if nums[mid] == target {
            return mid
        } else if nums[mid] < target {
            return helper(nums, mid+1, right, target)
        } else {
            return helper(nums, left, mid-1, target)
        }
    }

}
