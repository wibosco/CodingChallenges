// Created 06/05/2025.

import Foundation

//https://leetcode.com/problems/maximum-number-of-fish-in-a-grid/
struct MaximumNumberOfFishInAGrid {
    
    //Time: O(n * m) where n is the number of rows in `grid`
    //               where m is the number of columns in `grid`
    //Space: O(n * m(
    //graph theory
    //matrix
    //DFS
    //recursive
    //multi-source
    //relative indexing
    //marking
    //
    //Solution Description:
    //Treating `grid` as a graph, containing multiple unconnected subgraphs. First we iterate through each element in `grid` and
    //perform DFS to determine if this element is part of a water subgraph. If it is we use relative indexing to explore all
    //connected water elements. During the DFS we "fish" each water element to build up `fishCount`. Once a water has been
    //"fished" we overwrite its value to 0 so as to ensure tha we don't return to that element. When a subgraph has been explored
    //we compare the `fishCount` value against the current `maxFishCount` value and set whichever value is bigger to
    //`maxFishCount`. We repeat this process for all subgraphs. We then return `maxFishCount`.
    func findMaxFish(_ grid: [[Int]]) -> Int {
        var maxFishCount = 0
        var grid = grid
        
        for row in 0..<grid.count {
            for column in 0..<grid[row].count {
                let fishCount = dfs(&grid, row, column)
                maxFishCount = max(maxFishCount, fishCount)
            }
        }
        
        return maxFishCount
    }
    
    private func dfs(_ grid: inout [[Int]], _ row: Int, _ column: Int) -> Int {
        guard row >= 0, row < grid.count, column >= 0, column < grid[row].count else {
            return 0
        }
        
        var fishCount = grid[row][column]
        
        guard fishCount > 0 else { // 0 is land
            return 0
        }
        grid[row][column] = 0
        
        fishCount += dfs(&grid, (row - 1), column)
        fishCount += dfs(&grid, (row + 1), column)
        fishCount += dfs(&grid, row, (column - 1))
        fishCount += dfs(&grid, row, (column + 1))
        
        return fishCount
    }
}
