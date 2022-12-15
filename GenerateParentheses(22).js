/**
 * @param {number} n
 * @return {string[]}
 */
var generateParenthesis = function(n) {
    let res = [];
    helper(res, "", n, n, 2*n);
    
    return res;
};

const helper = (res, currStr, open, close, n)=> {
    if(open>close) return null;
    if(n==0) return res.push(currStr);
    
    let tmp = currStr;
    if(open>0){
        currStr += "(";
        helper(res, currStr, open-1, close, n-1);
    }
    currStr = tmp + ")";
    helper(res, currStr, open, close-1, n-1);
} 
