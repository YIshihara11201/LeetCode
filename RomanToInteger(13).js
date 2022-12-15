/**
 * @param {string} s
 * @return {number}
 */

const numeric = {
    I: 1,
    V: 5,
    X: 10,
    L: 50,
    C: 100,
    D: 500,
    M: 1000
}

var romanToInt = function(s) {
    let sum = 0;
    let currNum = 0;
    for(let i=0; i<s.length; i++){
        if(s.substring(i, i+1) === "I"){
            if(s.substring(i+1, i+2) === "V" || s.substring(i+1, i+2) === "X"){
                currNum = numeric[s.substring(i+1, i+2)] -1;
                sum += currNum;
                i++;
            }else{
                sum += numeric[s.substring(i, i+1)];
            }
        }else if(s.substring(i, i+1) === "X"){
            if(s.substring(i+1, i+2) === "L" || s.substring(i+1, i+2) === "C"){
                currNum = numeric[s.substring(i+1, i+2)] -10;
                sum += currNum;
                i++;
            }else{
                sum += numeric[s.substring(i, i+1)];
            }
        }else if(s.substring(i, i+1) === "C"){
            if(s.substring(i+1, i+2) === "D" || s.substring(i+1, i+2) === "M"){
                currNum = numeric[s.substring(i+1, i+2)] -100;
                sum += currNum;
                console.log(currNum);
                i++;
            }
            else {
                sum += numeric[s.substring(i, i+1)];
            }
        }else{
            sum += numeric[s.substring(i, i+1)];
        }
        
    }
    
    return sum;    
};
