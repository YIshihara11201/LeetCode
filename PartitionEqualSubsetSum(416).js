/**
 * @param {number[]} nums
 * @return {boolean}
 */
var canPartition = function(nums) {
    let sum = nums.reduce((prev, cur)=> prev+cur);
    if(sum%2==1) return false;
    
    let target = sum/2;
    let len = nums.length;
    
    let dp = new Array(len+1);
    for(let i=0; i<dp.length; i++){
        dp[i] = new Array(target+1);
    }
    
    for(let i=0; i<dp.length; i++){
        dp[i][0] = true;
    }
    for(let i=1; i<target+1; i++){
        dp[0][i] = false;
    }
    
    for(let i=1; i<dp.length; i++){
        for(let j=1; j<target+1; j++){
            dp[i][j] = dp[i-1][j];
            if(j>=nums[i-1]){
                dp[i][j] = (dp[i][j]||dp[i-1][j-nums[i-1]]);
            }
        }
    }
    
    return dp[len][target];
};
