//
//  ShortestBridge.swift
//  LeetCode
//
//  Created by William Boles on 29/10/2023.
//

import Foundation

//https://leetcode.com/problems/shortest-bridge/
struct ShortestBridge {
    
    //Time: O(n * m) where n is the number of rows in `grid`
    //               where m is the number of columns in `grid`
    //Space: O(n * m)
    //graph theory
    //DFS
    //BFS
    //visited
    //set
    //recursive
    //iterative
    //level traversal
    //relative indexing
    //
    //Solution Description:
    //First we use DFS to find and fully search one of the two islands using DFS and relative indexing. We then use that
    //island's indexes as the queue for using BFS to find the other island. Using BFS allows us to search in a
    //level-by-level fashion and so ensure that minimum number of steps are used to bridge the two islands.
    //
    //N.B. A set is used for the queue in the BFS section to minimise memory usage.
    func shortestBridge(_ grid: [[Int]]) -> Int {
        var island = Set<[Int]>()
        
        let relativeIndexes = [[-1, 0], [1, 0], [0, -1], [0, 1]] //up down left right
        
        outer: for row in 0..<grid.count {
            for column in 0..<grid[row].count {
                if grid[row][column] == 1 {
                    dfs(grid, row, column, relativeIndexes, &island)
                    
                    break outer
                }
            }
        }
        
        return bfs(grid, island, relativeIndexes)
    }
    
    private func dfs(_ grid: [[Int]], _ row: Int, _ column: Int, _ relativeIndexes: [[Int]], _ visited: inout Set<[Int]>) {
        guard row >= 0, row < grid.count, column >= 0, column < grid[row].count else {
            return
        }
        
        guard grid[row][column] == 1 else {
            return
        }
        
        guard !visited.contains([row, column]) else {
            return
        }
        
        visited.insert([row, column])
        
        for relativeIndex in relativeIndexes {
            let rowNext = row + relativeIndex[0]
            let columnNext = column + relativeIndex[1]
            
            dfs(grid, rowNext, columnNext, relativeIndexes, &visited)
        }
    }
    
    private func bfs(_ grid: [[Int]], _ island: Set<[Int]>, _ relativeIndexes: [[Int]]) -> Int {
        var count = 0
        
        var queue = island //use a set for the queue to avoid storing same index multiple times
        
        while !queue.isEmpty {
            var newQueue = Set<[Int]>()
            
            for index in queue {
                for relativeIndex in relativeIndexes {
                    let rowNext = index[0] + relativeIndex[0]
                    let columnNext = index[1] + relativeIndex[1]
                    
                    guard rowNext >= 0, rowNext < grid.count, columnNext >= 0, columnNext < grid[rowNext].count else {
                        continue
                    }
                    
                    guard !island.contains([rowNext, columnNext]) else {
                        continue
                    }
                    
                    guard grid[rowNext][columnNext] == 0 else {
                        return count
                    }
                    
                    newQueue.insert([rowNext, columnNext])
                }
            }
            
            queue = newQueue
            count += 1
        }
        
        return -1
    }
}
