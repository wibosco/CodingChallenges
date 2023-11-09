//
//  IslandPerimeter.swift
//  LeetCode
//
//  Created by William Boles on 28/10/2023.
//

import Foundation

//https://leetcode.com/problems/island-perimeter/
struct IslandPerimeter {
    
    //Time: O(n * m) where n is the number of rows in `grid`
    //               where m is the number of columns in `grid`
    //Space: O(n * m)
    //graph theory
    //DFS
    //recursive
    //relative indexing
    //matrix
    //
    //Solution Description:
    //We loop through the elements in `grid` until we find land (1). Upon finding land we perform a DFS to find all connected
    //land using relative indexing. Land has a perimeter if it borders the edge of `grid` or is connected to water (0), where
    //either of these conditions are met (base case), we return 1 to represent that this element of land has 1 perimeter in
    //the given direction. We continue DFS until all possible connected land elements have been search and return the
    //accumulated perimeter count. As `grid` only has one island we return that count straight away.
    static func islandPerimeter(_ grid: [[Int]]) -> Int {
        var landVisited = Set<[Int]>()
        let relativeIndexes = [[-1, 0], [1, 0], [0, -1], [0, 1]] //up, down, left, right
        
        for row in 0..<grid.count {
            for column in 0..<grid[row].count {
                if grid[row][column] == 1 {
                    let count = dfs(grid, row, column, &landVisited, relativeIndexes)
                    
                    return count //only one island so return
                }
            }
        }
        
        return -1
    }
    
    private static func dfs(_ grid: [[Int]], _ row: Int, _ column: Int, _ landVisited: inout Set<[Int]>, _ relativeIndexes: [[Int]]) -> Int {
        guard row >= 0, row < grid.count, column >= 0, column < grid[row].count else {
            return 1
        }
        
        guard grid[row][column] == 1 else {
            return 1
        }
        
        guard !landVisited.contains([row, column]) else {
            return 0
        }
        
        landVisited.insert([row, column])
        
        var count = 0
        
        for relativeIndex in relativeIndexes {
            let nextRow = row + relativeIndex[0]
            let nextColumn = column + relativeIndex[1]
            
            count += dfs(grid, nextRow, nextColumn, &landVisited, relativeIndexes)
        }
        
        return count
    }
}
