/**
 * @param {number[]} nums
 * @return {number}
 */
var singleNumber = function(nums) {
    const cache = {}
    for(let i=0; i<nums.length; i++){
        if(cache[nums[i]] == undefined) cache[nums[i]] = 1;
        else cache[nums[i]]++;
    }
    
    return Object.entries(cache).filter(ele=>ele[1]==1).map(ele=>ele[0]);
};
