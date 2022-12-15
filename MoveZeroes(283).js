/**
 * @param {number[]} nums
 * @return {void} Do not return anything, modify nums in-place instead.
 */
var moveZeroes = function(nums) {
    let startIdx = -1;
    let lastIdx = -1;
    
    for(let i=0; i<nums.length; i++) {
        if(nums[i]==0) {
            if(startIdx==-1) {
                startIdx = i;
                endIdx = startIdx;
            } else {
                endIdx = i;
            }
        } else if(startIdx != -1) {
            nums[startIdx] = nums[i];
            nums[i] = 0;
            if(startIdx!=endIdx){
                startIdx += 1;
                endIdx = i;
            } else {
                startIdx = i;
                endIdx = startIdx;
            }   
        }
    }
    
    return nums;
};
