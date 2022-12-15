/**
 * @param {string} s
 * @param {string} t
 * @return {boolean}
 */
var isSubsequence = function(s, t) {
    
    for(let i=0; i<s.length; i++){
        let curCharIndex = t.indexOf(s.substring(i,i+1));
        if(curCharIndex==-1) return false;
        else t = t.substring(curCharIndex+1);
    }
    return true;
};
