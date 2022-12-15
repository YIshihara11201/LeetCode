/**
 * @param {string} s
 * @return {string[][]}
 */
var partition = function(s) {
    let res = [];
    let part = [];
    
    const dfs = (index)=> {
        if(index>=s.length) {
            res.push([...part]);
            return;
        }
        
        for(let end=index; end<s.length; end++) {
            if(isPalindrome(s, index, end)) {
                part.push(s.substring(index, end+1));
                dfs(end+1);
                part.pop();
            }
        }
    }
    
    dfs(0);
    return res;
};

const isPalindrome = (s, start, end)=> {
    while(start<end) {
        if(s.substring(start, start+1) != s.substring(end, end+1)) return false;
        start++;
        end--;
    }
    return true;
}
