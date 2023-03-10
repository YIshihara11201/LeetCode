/**
 * @param {number} rowIndex
 * @return {number[]}
 */
var getRow = function(rowIndex) {
    let res = [];
    for(let i=0; i<=rowIndex; i++){
        let row = new Array(i+1);
        row[0] = 1;
        row[i] = 1;
        for(let j=1; j<i; j++){
            row[j] = res[i-1][j-1]+res[i-1][j];
        }
        res.push(row);
    }
    
    return res[rowIndex];
};
