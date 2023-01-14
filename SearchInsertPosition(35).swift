class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count-1
        
        var ans = -1
        while(left<=right){    
            let mid = (left+right)/2
            
            if nums[mid] == target {
                ans = mid
                break
            }

            if nums[mid] < target {
                left = mid + 1
                if left > right {
                    if nums[right] < target {
                        ans = right + 1
                        break
                    } else {
                        ans = right
                        break
                    }    
                }
            } else {
                right = mid - 1
                 if right < left {
                    if nums[left] < target {
                        ans = left + 1
                        break
                    } else {
                        ans = left
                        break
                    }    
                }
            }
        }

        return ans
    }
}
