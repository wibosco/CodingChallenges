//
//  MaxAreaOfIsland.swift
//  LeetCode
//
//  Created by William Boles on 10/05/2023.
//

import Foundation

//https://leetcode.com/problems/max-area-of-island/
struct MaxAreaOfIsland {
    
    //Time: O(n * m) where n is the number for row in grid
    //               where m is the number for columns in grid
    //Space: O(n * m)
    //graph theory
    //DFS
    //relative indexing
    //matrix
    //visited
    //recursive
    //multi-source
    //
    //Solution Description:
    //We traverse through `grid` checking if each index contains land (1). If that index is land then we perform a DFS
    //from that index to find all connected land indexes. We use relative indexing to determine where we can move to
    //during DFS. To avoid visiting an index multiple times we set the value of that index to water (0).
    static func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        var largest = 0
        var grid = grid
        
        for row in 0..<grid.count {
            for column in 0..<grid[row].count {
                var current = 0
                
                search(&grid, row, column, &current)
                
                largest = max(largest, current)
            }
        }
        
        return largest
    }
    
    private static func search(_ grid: inout [[Int]], _ row: Int, _ column: Int, _ current: inout Int) {
        guard row >= 0, row < grid.count else {
            return
        }
        
        guard column >= 0, column < grid[row].count else {
            return
        }
        
        guard grid[row][column] == 1 else {
            return
        }

        current += 1
        
        //no need for a visited set as we make this index unvisitable by setting it to water
        grid[row][column] = 0
        
        search(&grid, row + 1, column, &current)
        search(&grid, row - 1, column, &current)
        search(&grid, row, column + 1, &current)
        search(&grid, row, column - 1, &current)
    }
    
    //Time: O(n * m) where n is the number for row in grid
    //               where m is the number for columns in grid
    //Space: O(n * m)
    //graph theory
    //DFS
    //relative indexing
    //matrix
    //visited
    //recursive
    //multi-source
    //
    //Solution Description:
    //We traverse through `grid` checking if each index contains land (1). If that index is land then we perform a DFS
    //from that index to find all connected land indexes. We use relative indexing to determine where we can move to
    //during DFS. To avoid visiting an index multiple times we store each index that we visit and skip it if we come
    //across that index again.
    static func maxAreaOfIslandAlt(_ grid: [[Int]]) -> Int {
        var largest = 0
        var visited = Set<[Int]>()
        
        for row in 0..<grid.count {
            for column in 0..<grid[row].count {
                guard grid[row][column] == 1 else {
                    continue
                }
                
                var current = 0
                
                dfs(grid, row, column, &visited, &current)
                
                largest = max(largest, current)
            }
        }
        
        return largest
    }
    
    private static func dfs(_ grid: [[Int]], _ row: Int, _ column: Int, _ visited: inout Set<[Int]>, _ current: inout Int) {
        guard !visited.contains([row, column]) else {
            return
        }
        
        visited.insert([row, column])
        
        current += 1
        
        let neighbors = landNeighbors(grid, row, column, &visited)
        
        for neighbor in neighbors {
            dfs(grid, neighbor[0], neighbor[1], &visited, &current)
        }
    }
    
    private static func landNeighbors(_ grid: [[Int]], _ row: Int, _ column: Int, _ visited: inout Set<[Int]>) -> [[Int]] {
        let relativeIndex = [[0, -1], [-1, 0], [1, 0], [0, 1]]
        
        var neighbors = [[Int]]()
        
        for offset in relativeIndex {
            let newRow = row + offset[0]
            let newColumn = column + offset[1]
            
            guard newRow >= 0, newRow < grid.count else {
                continue
            }
            
            guard newColumn >= 0, newColumn < grid[newRow].count else {
                continue
            }
            
            guard grid[newRow][newColumn] == 1 else {
                continue
            }
            
            let neighbor = [newRow, newColumn]
            
            guard !visited.contains(neighbor) else {
                continue
            }
            
            neighbors.append(neighbor)
        }
        
        return neighbors
    }
}
