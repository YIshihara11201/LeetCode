/**
 * @param {string} s
 * @return {number}
 */
var lengthOfLongestSubstring = function(s) {
    let max = s.substring(0,1);
    let left = 0;
    let right = 1;
    while(right<s.length){
        let currStr = s.substring(left, right);
        let nextChar = s.substring(right, right+1);
        
        if(currStr.includes(nextChar)){
            left += 1;
            right = left;
        }else if (max.length<s.substring(left, right+1).length){
            max = s.substring(left, right+1);
        }
        right++;
    }
  
    return max.length;
};
