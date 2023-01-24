class Solution {
    func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
        if nums.count < 3 {
            return 0
        }
        
        var res = 0
        var i = 1
        while i < nums.count-1 {
            let curr = nums[i]-nums[i-1]
            var cnt = 2
            for j in i+1..<nums.count {
                if curr == nums[j]-nums[j-1] {
                    cnt += 1
                    if j == nums.count-1 {
                        i = nums.count
                    }
                } else {
                    i = j
                    break
                }
            }
            if cnt >= 3 {
                res += summation(num: cnt-2)
            }
        }

       return res
    }

    func summation(num: Int) -> Int {
        var res = num
        var curr = num-1
        while curr >= 1 {
            res += curr
            curr -= 1
        }
        return res
    }
}
