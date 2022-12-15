/**
 * @param {number[][]} matrix
 * @return {void} Do not return anything, modify matrix in-place instead.
 */
var rotate = function(matrix) {
    
    let size = matrix.length;
    
    for(let i=0; i<size/2; i++) {
        for(let j=0; j<size; j++) {
            let temp = matrix[i][j];
            matrix[i][j] = matrix[size-i-1][j];
            matrix[size-i-1][j] = temp;
        }
    }
    
    for(let i=0; i<size; i++) {
        for(let j=i+1; j<size; j++) {
            let temp = matrix[i][j];
            matrix[i][j] = matrix[j][i];
            matrix[j][i] = temp;
        }
    }
    
    return matrix;
};
