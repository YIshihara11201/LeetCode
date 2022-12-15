/**
 * @param {number[]} candidates
 * @param {number} target
 * @return {number[][]}
 */
var combinationSum = function(candidates, target) {
    let res = [];
    let combi = [];
    
    backtrack(candidates, 0, target, combi, res);
    return res;
};

const backtrack = (arr, start, target, combi, res)=> {
    if(target == 0) res.push([...combi]);
    if(target<0) return;
    for(let i=start; i<arr.length; i++){
        combi.push(arr[i])
        backtrack(arr, i, target-arr[i], combi, res);
        combi.pop();
    }
}
