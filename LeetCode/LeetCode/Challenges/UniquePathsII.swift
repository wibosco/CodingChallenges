//
//  UniquePathsII.swift
//  LeetCode
//
//  Created by William Boles on 01/04/2022.
//

import Foundation

//https://leetcode.com/problems/unique-paths-ii/
struct UniquePathsII {
    
    //Time: O(n * m) where m is the rows
    //               where n is the columns
    //Space: O(n * m)
    //matrix
    //dynamic programming
    //
    //Solution Description:
    //Iterating through the matrix we can generate the count of the possible paths to any given cell by taking the possible
    //paths to the cell in the row directly above and the possible paths to the cell directly to the left and adding them.
    //As this grid can contain obstacles we treat these cells as a restart for that paths counts and so set the value of
    //those cells to zero. We can repeat this process for all cells  until we reach the target cell (bottom right) at which
    //point we will have the number of possible paths to that cell as the cells value.
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        guard obstacleGrid[0][0] != 1 else {
            return 0
        }
        
        var obstacleGrid = obstacleGrid
        
        let rowsCount = obstacleGrid.count
        let columnCount = obstacleGrid[0].count
        
        obstacleGrid[0][0] = 1 //first cell is a 1
        
        for row in 1 ..< rowsCount { //setup the first row
            obstacleGrid[row][0] = (obstacleGrid[row][0] == 0 && obstacleGrid[row - 1][0] == 1) ? 1 : 0
        }
        
        for column in 1 ..< columnCount { //setup the first column
            obstacleGrid[0][column] = (obstacleGrid[0][column] == 0 && obstacleGrid[0][column - 1] == 1) ? 1 : 0
        }
        
        for row in 1 ..< rowsCount { //first row already been processed
            for column in 1 ..< columnCount { //first column already been processed
                if obstacleGrid[row][column] == 0 {
                    obstacleGrid[row][column] = obstacleGrid[row - 1][column] + obstacleGrid[row][column - 1]
                } else {
                    obstacleGrid[row][column] = 0 //restart paths count
                }
            }
        }
        
        return obstacleGrid[rowsCount - 1][columnCount - 1]
    }
    
    //Time: O(2^(n)) where n is the number of cells in the grid
    //Space: O(n)
    //matrix
    //DFS
    //backtracking
    //relative indexing
    //recursive
    //inout
    //
    //Solution Description:
    //Starting a `0, 0` we use backtracking to move through the matrix. At each cell is attempt to make one of two moves (in
    //different branches): `down` and `right`. With both of these moves we check if the cell is empty i.e. `0` and that the
    //cell is in the bounds of the matrix i.e. for `down`, row is less than the row count and for `right`, column is less
    //then the column count. We repeat these moves until either we reach `target` at which time we increment `count` or we
    //can't take any more moves on our current branch and so abandon it.
    func uniquePathsWithObstaclesDFS(_ obstacleGrid: [[Int]]) -> Int {
        guard obstacleGrid[0][0] != 1 else {
            return 0
        }
        
        var count = 0
        let target = [(obstacleGrid.count - 1), (obstacleGrid[0].count - 1)]
        
        dfs(obstacleGrid, 0, 0, target, &count)
        
        return count
    }
    
    private func dfs(_ grid: [[Int]], _ row: Int, _ column: Int, _ target: [Int], _ count: inout Int) {
        guard [row, column] != target else {
            count += 1
            return
        }
        
        if (row + 1) < grid.count {
            let newRow = (row + 1)
            if grid[newRow][column] == 0 {
                dfs(grid, newRow, column, target, &count)
            }
        }
        
        if (column + 1) < grid[row].count {
            let newColumn = (column + 1)
            if grid[row][newColumn] == 0 {
                dfs(grid, row, newColumn, target, &count)
            }
        }
    }
}
