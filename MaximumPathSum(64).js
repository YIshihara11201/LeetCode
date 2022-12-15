/**
 * @param {number[][]} grid
 * @return {number}
 */
var minPathSum = function(grid) {
    let height = grid.length;
    let width = grid[0].length;
    
    for(let row=0; row<height; row++) {
        for(let col=0; col<width; col++) {
            if(row==0 && col==0) grid[row][col] = grid[row][col];
            else if (row==0 && col!=0) grid[row][col] += grid[row][col-1];
            else if (row!=0 && col==0) grid[row][col] += grid[row-1][col];
            else grid[row][col] += Math.min(grid[row-1][col], grid[row][col-1]);
        }
    }
    
    console.log(grid);
    return grid[height-1][width-1];
};
