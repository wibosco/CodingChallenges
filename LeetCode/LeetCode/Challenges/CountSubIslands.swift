//
//  CountSubIslands.swift
//  LeetCode
//
//  Created by William Boles on 24/10/2023.
//

import Foundation

//https://leetcode.com/problems/count-sub-islands/
struct CountSubIslands {
    
    //Time: O(n * m) where n is the number of rows
    //               where m is the the number of columns
    //Space: O(n * m)
    //graph theory
    //matrix
    //relative indexing
    //DFS
    //recursive
    //multi-source
    //marking
    //inline
    //
    //Solution Description:
    //Using DFS and relative indexing we fully search each island encountered in `grid2`. Each `grid2` land element we compare
    //against the corresponding element in `grid1`, if the element in `grid1` is also land we know that this `grid2` island is
    //a potential sub-island; if the element in `grid1` is water then we know this `grid2` island can not be a sub-island -
    //when a non-sub-island is encountered we don't stop searching that island as we need to "mark" the whole island as
    //invalid. To ensure that we don't search the same island multiple times we update `grid2` transform those land elements
    //into water. As an island can start at any index in `grid2` we must attempt to begin the search at each index in `grid2`.
    static func countSubIslands(_ grid1: [[Int]], _ grid2: [[Int]]) -> Int {
        var count = 0
        var grid2 = grid2
        
        for row in 0..<grid2.count {
            for column in 0..<grid2[row].count {
                if grid2[row][column] == 1 && dfs(grid1, &grid2, row, column) {
                    count += 1
                }
            }
        }
        
        return count
    }
    
    private static func dfs(_ grid1: [[Int]], _ grid2: inout [[Int]], _ row: Int, _ column: Int) -> Bool {
        if row < 0 || row > (grid2.count - 1) || column < 0 || column > (grid2[row].count - 1) {
            return true
        }
        
        if grid2[row][column] == 0 {
            return true
        }
        
        grid2[row][column] = 0
        
        var isSubIsland = grid1[row][column] == 1
        
        //careful here as in swift if the first condtion in the AND is false, the second condtion isn't executed
        isSubIsland = dfs(grid1, &grid2, (row - 1), column) && isSubIsland //above
        isSubIsland = dfs(grid1, &grid2, (row + 1), column) && isSubIsland //below
        isSubIsland = dfs(grid1, &grid2, row, (column - 1)) && isSubIsland //left
        isSubIsland = dfs(grid1, &grid2, row, (column + 1)) && isSubIsland //right
        
        return isSubIsland
    }
    
    //Time: O(n * m) where n is the number of rows
    //               where m is the the number of columns
    //Space: O(n * m)
    //graph theory
    //matrix
    //relative indexing
    //DFS
    //recursive
    //visited
    //multi-source
    //set
    //
    //Solution Description:
    //Using DFS and relative indexing we fully search each island encountered in `grid2`. Each `grid2` land element we compare
    //against the corresponding element in `grid1`, if the element in `grid1` is also land we know that this `grid2` island is
    //a potential sub-island; if the element in `grid1` is water then we know this `grid2` island can not be a sub-island -
    //when a non-sub-island is encountered we don't stop searching that island as we need to "mark" the whole island as invalid.
    //To ensure that we don't search the same island multiple times we use a `visited` set to store the indexes of the element
    //already encountered. As an island can start at any index in `grid2` we must attempt to begin the search at each index in
    //`grid2`.
    static func countSubIslandsVisited(_ grid1: [[Int]], _ grid2: [[Int]]) -> Int {
        var count = 0
        var visited = Set<[Int]>()
        
        for row in 0..<grid2.count {
            for column in 0..<grid2[row].count {
                if visited.contains([row, column]) {
                    continue
                }
                
                visited.insert([row, column])
                
                if grid2[row][column] == 0 {
                    continue
                }
                
                if dfsVisited(grid1, grid2, row, column, &visited) {
                    count += 1
                }
            }
        }
        
        return count
    }
    
    private static func dfsVisited(_ grid1: [[Int]], _ grid2: [[Int]], _ row: Int, _ column: Int, _ visited: inout Set<[Int]>) -> Bool {
        var isSubIsland = grid1[row][column] == 1
        
        let neighbors = landNeighbors(grid2, row, column)
        
        for neighbor in neighbors {
            if visited.contains(neighbor) {
               continue
            }
            
            visited.insert(neighbor)
            
            //careful here as in swift if the first condtion in the AND is false, the second condtion isn't executed
            isSubIsland = dfsVisited(grid1, grid2, neighbor[0], neighbor[1], &visited) && isSubIsland
        }
        
        return isSubIsland
    }
    
    private static func landNeighbors(_ grid: [[Int]], _ row: Int, _ column: Int) -> [[Int]] {
        var neighbours = [[Int]]()
        
        let relativeIndexing = [[-1, 0], [0, -1], [0, 1], [1, 0]] //[row, column]
        
        for index in relativeIndexing {
            let newRow = row + index[0]
            let newColumn = column + index[1]
            
            if newRow < 0 || newRow > (grid.count - 1) || newColumn < 0 || newColumn > (grid[newRow].count - 1) {
                continue
            }
            
            if grid[newRow][newColumn] == 0 {
                continue
            }
            
            neighbours.append([newRow, newColumn])
        }
        
        return neighbours
    }
}
