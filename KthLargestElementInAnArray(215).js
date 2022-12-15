/**
 * @param {number[]} nums
 * @param {number} k
 * @return {number}
 */
var findKthLargest = function(nums, k) {
    let ordered = nums.sort((prev, curr)=>{
        return curr-prev;
    });
    
    console.log(ordered);
    return ordered[k-1];
};
