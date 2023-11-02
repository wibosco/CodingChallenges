//
//  NumberOfEnclaves.swift
//  LeetCode
//
//  Created by William Boles on 02/11/2023.
//

import Foundation

//
struct NumberOfEnclaves {
    
    //Time: O(n * m) where n is the number of rows in `grid`
    //               where m is the number of columns in `grid`
    //Space: O(m * n)
    //graph theory
    //DFS
    //recursive
    //visited
    //matrix
    //set
    //relative indexing
    //
    //Solution Description:
    //Using DFS we search from each land square/element that we find using relative indexing to determin which direction(s)
    //to search in. To avoid re-searching the same island from multiple starting squares we using a `visited` set to abort
    //any attempt to do so. As we are interested in the number of sqaures we use a seperate `dfsVisited` for each
    //non-visited island - the count of this set is then added to `count`. As we are only interest in enclaves, if any
    //square of an island "touches" the border of `grid` we don't include that island in our count but we do continue
    //searching it to so we can eliminate that whole island from any future searches. At the end of each search we merge
    //`dfsVisited` into `visited`.
    static func numEnclaves(_ grid: [[Int]]) -> Int {
        var count = 0
        var visited = Set<[Int]>()
        let relativeIndexes = [[-1, 0], [1, 0], [0, -1], [0, 1]] // [up, down, left, right]
        
        for row in 0..<grid.count {
            for column in 0..<grid[row].count {
                guard grid[row][column] == 1 else {
                    continue
                }
                
                guard !visited.contains([row, column]) else {
                    continue
                }
                
                var dfsVisited = Set<[Int]>()
                dfsVisited.insert([row, column])
                
                if dfs(grid, row, column, relativeIndexes, &dfsVisited) {
                    count += dfsVisited.count
                }
                
                visited.formUnion(dfsVisited)
            }
        }
        
        return count
    }
    
    private static func dfs(_ grid: [[Int]], _ row: Int, _ column: Int, _ relativeIndexes: [[Int]], _ visited: inout Set<[Int]>) -> Bool {
        var enclave = !(row == 0 || row == (grid.count - 1) || column == 0 || column == (grid[row].count - 1))
        for relativeIndex in relativeIndexes {
            let nextRow = row + relativeIndex[0]
            let nextColumn = column + relativeIndex[1]
            
            guard nextRow >= 0, nextRow < grid.count, nextColumn >= 0, nextColumn < grid[nextRow].count else {
                continue
            }
            
            guard grid[nextRow][nextColumn] == 1 else {
                continue
            }
            
            guard !visited.contains([nextRow, nextColumn]) else {
                continue
            }
            visited.insert([nextRow, nextColumn])
            
            if !dfs(grid, nextRow, nextColumn, relativeIndexes, &visited) {
                enclave = false
            }
        }
        
        return enclave
    }
}
