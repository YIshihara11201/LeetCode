class Solution {
	func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
		
		for i in 0..<m {
			nums1[m+n-1-i] = nums1[m-1-i]
		}
		for i in 0..<n {
			nums1[i] = 0
		}
		
		var idx = 0
		var idx1 = n
		var idx2 = 0
		
		while idx<nums1.count && idx1<nums1.count && idx2<nums2.count {
			if nums1[idx1] <= nums2[idx2] {
				nums1[idx] = nums1[idx1]
				idx1 += 1
			} else {
				nums1[idx] = nums2[idx2]
				idx2 += 1
			}
			idx += 1
		}
		
		while idx < nums1.count && idx1 < nums1.count {
			nums1[idx] = nums1[idx1]
			idx += 1
			idx1 += 1
		}
		
		while idx < nums1.count && idx2 < nums2.count {
			nums1[idx] = nums2[idx2]
			idx += 1
			idx2 += 1
		}
	}
	
}
