class Solution {
    func pivotIndex(_ nums: [Int]) -> Int {
       if nums.count == 1 {
           return 0
       }

       var acc = [Int](repeating: 0, count: nums.count)
       acc[0] = nums[0]
       for i in 1..<nums.count {
           acc[i] = acc[i-1] + nums[i]    
       }
       
       var res = -1
       for idx in 0..<acc.count {
           let right = acc[acc.count-1]-acc[idx]
           let left = acc[idx] - nums[idx]
           if right == left {
                res = idx
                break 
           }
       }
       
       return res
    }
}
