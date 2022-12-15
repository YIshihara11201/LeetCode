/**
 * @param {string[]} strs
 * @return {string}
 */
 var longestCommonPrefix = function(strs) {

    let benchmark = Array.from(strs[0]);
    
    for(let i=1; i<strs.length; i++){
        if(benchmark.length == 0) break;
        let currString = strs[i];
        for(let j=0; j<benchmark.length; j++){

            if(currString.substring(j, j+1) !== benchmark[j]){
             benchmark = benchmark.slice(0, j);
                break;
            }
        }   
    }
    let result = "";
    for(let i=0; i<benchmark.length; i++){
        if(benchmark[i]) result += benchmark[i];
    }    
    return result;
};
