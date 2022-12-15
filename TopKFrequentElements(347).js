/**
 * @param {number[]} nums
 * @param {number} k
 * @return {number[]}
 */
var topKFrequent = function(nums, k) {
    let cache = {};
    for(let i=0; i<nums.length; i++) {
        if(cache[nums[i]]==undefined) {
            cache[nums[i]] = 1;
        } else {
            cache[nums[i]]++;
        }
    }
    
 
    let sortedObj = (Object.entries(cache).sort((cur, next) => {
        return next[1]-cur[1];
    }));
    
    return sortedObj.map(item=>item[0]).slice(0,k);
};
