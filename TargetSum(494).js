/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number}
 */
var findTargetSumWays = function(nums, target) {
    
    let count = 0;
    
    const backtrack = (nums, index, target, sum)=> {
        if(index==nums.length) {
            if(sum==target) count++;  
            return;
        }
        backtrack(nums, index+1, target, sum+nums[index]);
        backtrack(nums, index+1, target, sum-nums[index]);
    }
    
    backtrack(nums, 0, target, 0);
    return count;
};
