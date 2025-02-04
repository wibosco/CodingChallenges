//
//  NumberOfClosedIslands.swift
//  LeetCode
//
//  Created by William Boles on 31/10/2023.
//

import Foundation

//https://leetcode.com/problems/number-of-closed-islands/
struct NumberOfClosedIslands {
    
    //Time: O(n * m) where n is the number of rows in grid
    //               where m is the number of columns in grid
    //Space: O(n)
    //graph theory
    //DFS
    //recursive
    //relative indexing
    //matrix
    //visited
    //
    //Solution Description:
    //In order for a island to be "closed" it must be surrounded by water. The border of the graph does not count as so
    //we can perform a DFS from each square/element of land than we find and know that if we encounter the graph border
    //then this island is not closed. We use relative indexing to determine in which direction we can move. To avoid
    //re-searching a previously searched square we store each land square we encounter in `visited`. When we encounter
    //the border of the graph we don't end our DFS,  instead we allow it to continue to find the full extent of the
    //island so that all those squares can be eliminated from any future searches (via the `visited` set).
    func closedIsland(_ grid: [[Int]]) -> Int {
        var closedCount = 0
        var visited = Set<[Int]>()
        let relativeIndexing = [[-1, 0], [1, 0], [0, -1], [0, 1]] //[up, down, left, right]
        
        for row in 0..<grid.count {
            for column in 0..<grid[row].count {
                guard grid[row][column] == 0 else {
                    continue
                }
                
                guard !visited.contains([row, column]) else {
                    continue
                }
                visited.insert([row, column])
                
                if dfs(grid, row, column, relativeIndexing, &visited) {
                    closedCount += 1
                }
            }
        }
        
        return closedCount
    }
    
    private func dfs(_ grid: [[Int]], _ row: Int, _ column: Int, _ relativeIndexing: [[Int]], _ visited: inout Set<[Int]>) -> Bool {
        var closed = row > 0 && row < (grid.count - 1) && column > 0 && column < (grid[row].count - 1)
        
        for relativeIndex in relativeIndexing {
            let nextRow = row + relativeIndex[0]
            let nextColumn = column + relativeIndex[1]
            
            guard nextRow >= 0, nextRow < grid.count, nextColumn >= 0, nextColumn < grid[nextRow].count else {
                continue
            }
            
            guard grid[nextRow][nextColumn] == 0 else {
                continue
            }
            
            guard !visited.contains([nextRow, nextColumn]) else {
                continue
            }
            visited.insert([nextRow, nextColumn])
            
            if !dfs(grid, nextRow, nextColumn, relativeIndexing, &visited) {
                closed = false
            }
        }
        
        return closed
    }
}
