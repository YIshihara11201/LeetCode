class Solution {
	func reverseWords(_ s: String) -> String {
		let arr = s.split(separator: " ")
		var res = ""
		for i in 0..<arr.count {
			res += helper(String(arr[i]))
			if i != arr.count-1 {
				res += " "
			}
		}
		
		return res
	}
	
	func helper(_ subString: String) -> String {
		var reversed = subString
		for i in 0..<subString.count/2 {
			let left = reversed.index(reversed.startIndex, offsetBy: i)
			let right = reversed.index(reversed.startIndex, offsetBy: reversed.count-1-i)
			
			let tmp = String(reversed[left])
			reversed.replaceSubrange(left...left, with: String(reversed[right]))
			reversed.replaceSubrange(right...right, with: tmp)
		}
		return reversed
	}
}
