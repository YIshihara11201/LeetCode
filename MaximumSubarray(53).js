/**
 * @param {number[]} nums
 * @return {number}
 */
var maxSubArray = function(nums) {
    let curIndex = 0;
    let max = Number.NEGATIVE_INFINITY;
    let sum = 0;
    
    while(curIndex<nums.length) {
        sum += nums[curIndex];
        if(sum > max) max = sum;
        if(sum<0) sum = 0;
        
        curIndex++;
    }
    
    return max;
};
