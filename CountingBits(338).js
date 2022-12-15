/**
 * @param {number} n
 * @return {number[]}
 */
var countBits = function(n) {
    let ans = [];
    for(let i=0; i<=n; i++){
        let curr = i;
        let count = 0;
        while(curr>0){
            count += curr%2;
            curr = Math.floor(curr/2);
            console.log(curr);
        }
        ans.push(count);
    }
    return ans;
};
