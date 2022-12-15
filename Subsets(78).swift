class Solution {
    var res = [[Int]]()
    func subsets(_ nums: [Int]) -> [[Int]] {
        var subArray = [Int]()
        
        subsetsHelper(nums, &subArray, 0)
        return res
    }

    func subsetsHelper(_ nums: [Int], _ subArray: inout [Int], _ index: Int) {
        if index == nums.count {
            res.append(subArray)
            return
        }
        
        subArray.append(nums[index])
        subsetsHelper(nums, &subArray, index+1)
        subArray.removeLast()
        subsetsHelper(nums, &subArray, index+1)
        
    }
}
