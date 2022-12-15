/**
 * @param {string} s
 * @return {boolean}
 */
const pair ={
    "}": "{",
    "]": "[",
    ")": "("
}

var isValid = function(s) {
    let open = [];
    for(let i=0; i<s.length; i++){
        let currCh = s.substring(i, i+1);
        if(currCh==="(" || currCh==="{" || currCh==="["){
            open.push(currCh);
        }else if(currCh===")" || currCh==="}" || currCh==="]"){
            console.log(currCh);
                console.log(open[open.length-1]);
            if(open[open.length-1]===pair[currCh]){
                
                open.pop();
            }else {
                return false;
            }
        }
    }
    
    console.log(open);
    
    return open.length==0? true:false;
};
