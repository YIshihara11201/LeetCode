/**
 * @param {number[]} nums
 * @param {number} k
 * @return {void} Do not return anything, modify nums in-place instead.
 */
var rotate = function(nums, k) {
    k %= nums.length;
    let len = nums.length;
    let rotatedChunk = nums.slice(len-k, len);
    
    
    for(let i=len-1-k; i>=0; i--) {
        nums[i+k] = nums[i];
    }
    for(let i=0; i<rotatedChunk.length; i++) {
        nums[i] = rotatedChunk[i];
    }
    
};
