class Solution {
	func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
		var dict1: [Int:Int] = [:]
		var dict2: [Int:Int] = [:]
		
		for item in nums1 {
			if dict1[item] == nil {
				dict1[item] = 1
			} else {
				dict1[item]! += 1
			}
		}
		
		for item in nums2 {
			if dict2[item] == nil {
				dict2[item] = 1
			} else {
				dict2[item]! += 1
			}
		}
		
		var res: [Int] = []
		for item in Set<Int>(nums1) {
			if let item1 = dict1[item],
			   let item2 = dict2[item] {
				let freq = item1 > item2 ? item2 : item1
				for _ in 0..<freq {
					res.append(item)
				}
			}
		}
		
		return res
	}
}
