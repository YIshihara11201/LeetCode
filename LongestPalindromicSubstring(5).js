/**
 * @param {string} s
 * @return {string}
 */

// https://www.youtube.com/watch?v=UflHuQj6MVA

var longestPalindrome = function(s) {
    let len = s.length;
    if(len == 1) return s;
    
    let dp = new Array(len);
    for(let i=0; i<len; i++) {
        dp[i] = new Array(len);
    }
    for(let i=0; i<len; i++) {
        dp[i][i] = true;
    }
    
    let start = 0;
    let end = 0;
    
    for(let i=1; i<len; i++) {
        for(let j=0; j<i; j++){
            if(s.charAt(j) == s.charAt(i)){
                if(i-j==1||dp[j+1][i-1]) {
                    dp[j][i] = true;
                    if(end-start < i-j){
                        start = j;
                        end = i;
                    }
                }
            } else {
                dp[j][i] = false;
            }
        }
    }
    
    return  s.substring(start, end+1);
};
