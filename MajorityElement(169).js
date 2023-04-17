/**
 * @param {number[]} nums
 * @return {number}
 */
var majorityElement = function(nums) {
    let cache = {};
    for(let i=0; i<nums.length; i++){
        if(cache[nums[i]] == undefined) cache[nums[i]] = 1;
        else cache[nums[i]]++;
        if(cache[nums[i]]>nums.length/2) return nums[i];
    }
};
