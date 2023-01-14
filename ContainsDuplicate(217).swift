class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var dict = [Int: Int]()

        for val in nums {
            if dict[val] != nil {
                return true
            } else {
                dict[val] = 1
            }
        }

        return false
    }
}
