// Created 05/05/2025.

import Foundation

//https://leetcode.com/problems/number-of-distinct-islands/
struct NumberOfDistinctIslands {
    
    //Time: O(n * m) where n is the number of rows in `grid`
    //               where m is the number of columns in `grid`
    //Space: O(n * m)
    //graph theory
    //DFS
    //recursive
    //inout
    //inline
    //set
    //multi-source
    //relative indexing
    //matrix
    //
    //Solution Description:
    //Treat the grid as graph, potentially containing multiple unconnected subgraphs. We iterate through the graph until we
    //find land (element containing `1`). Once we have found land we find all connected land using DFS. We traverse the graph
    //from this  initial element using relative indexing to select which direction to move in. To ensure that we don't
    //revisit elements we overwrite the current elements value with `0`. As we move through an island we build up a path of
    //that island by tracking which depth/level we are at and which direction we are traveling. This path acts as the islands
    //signature/fingerprint. This path is stored in a set `paths`. By using a set any duplicate paths are automatically
    //discarded. Once all elements in `grid` have been processed only distinct paths will be in `paths` and the count of
    //`paths` can be returned.
    //
    //N.B. `depth` must be tracked to avoid different island shapes producing the same path.
    //
    //Similar to: https://leetcode.com/problems/number-of-islands/
    func numDistinctIslands(_ grid: [[Int]]) -> Int {
        var grid = grid
        var paths = Set<[String]>()
        
        for row in 0..<grid.count {
            for column in 0..<grid[row].count {
                guard grid[row][column] == 1 else {
                    continue
                }
                
                var path = [String]()
                dfs(&grid, row, column, 0, "S", &path)
                
                paths.insert(path)
            }
        }
        
        return paths.count
    }
    
    private func dfs(_ grid: inout [[Int]], _ row: Int, _ column: Int, _ depth: Int, _ direction: String, _ path: inout [String]) {
        guard row >= 0, row < grid.count, column >= 0, column < grid[row].count else {
            return
        }
        
        guard grid[row][column] == 1 else {
            return
        }
        grid[row][column] = 0
        
        path.append(("\(depth)" + direction))
        
        dfs(&grid, (row - 1), column, (depth + 1), "U", &path)
        dfs(&grid, (row + 1), column, (depth + 1), "D", &path)
        dfs(&grid, row, (column - 1), (depth + 1), "L", &path)
        dfs(&grid, row, (column + 1), (depth + 1), "R", &path)
    }
}
