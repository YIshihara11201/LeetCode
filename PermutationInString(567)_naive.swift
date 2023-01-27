class Solution {
	func checkInclusion(_ s1: String, _ s2: String) -> Bool {
		if s1.count > s2.count { return false }
		
		let s1Arr = Array(s1)
		let s2Arr = Array(s2)
		
		var chArray1 = [Int](repeating: 0, count: 26)
		for ch in s1Arr {
			chArray1[Int(ch.asciiValue!)-97] += 1
		}
		
		var idx = 0
		var chArray2 = [Int](repeating: 0, count: 26)
		var currSubstr = String(s2Arr[idx...idx+s1Arr.count-1])
		for ch in currSubstr {
			chArray2[Int(ch.asciiValue!)-97] += 1
		}
		
		var isPermutation = compare(chArray1, chArray2)
		
		if isPermutation {
			return true
		}
		
		idx = s1.count
		while idx <= s2.count-1 {
			chArray2[Int(currSubstr[currSubstr.startIndex].asciiValue!)-97] -= 1
			let newChar = s2Arr[idx]
			chArray2[Int(newChar.asciiValue!)-97] += 1
			currSubstr.removeFirst()
			currSubstr += String(newChar)
			
			isPermutation = compare(chArray1, chArray2)
			if isPermutation {
				return true
			}
			idx += 1
		}
		
		return false
		
	}
	
	func compare(_ arr1: [Int], _ arr2: [Int]) -> Bool {
		var isPermutation = true
		for i in 0..<arr1.count {
			if arr1[i] != arr2[i] {
				isPermutation = false
				break
			}
		}
		
		return isPermutation
	}
	
}
