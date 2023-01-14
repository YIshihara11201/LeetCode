/**
 * The knows API is defined in the parent class VersionControl.
 *     func isBadVersion(_ version: Int) -> Bool{}
 */

class Solution : VersionControl {
    func firstBadVersion(_ n: Int) -> Int {        
        var left: Int = 1
        var right: Int = n

        var ans: Int = -1
        while(left <= right) {
            let mid = (left+right)/2
            let curr = isBadVersion(mid)
            
            if mid == 1 && curr {
                ans = mid
                break
            } else if curr && !isBadVersion(mid-1) {
                ans = mid
                break
            } else if !curr && isBadVersion(mid+1) {
                ans = mid+1
                break
            }

            if curr {
                right = mid-1
            } else {
                left = mid+1
            }
        }

        return ans
    }

}
