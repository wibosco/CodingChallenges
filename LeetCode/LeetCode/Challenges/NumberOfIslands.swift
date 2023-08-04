//
//  NumberOfIslands.swift
//  LeetCode
//
//  Created by William Boles on 12/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/number-of-islands/
struct NumberOfIslands {
    // swiftlint:disable comma
    static let relativeIndexing = [      [-1, 0],
                                   [0, -1],     [0, 1],
                                         [1, 0]]
    // swiftlint:enable comma
    
    //Time: O(m*n) where m is the number of rows in grid
    //             where n is the number of columns
    //Space: O(m*n)
    //graph theory
    //DFS
    //relative indexing
    //matrix
    //subgraphs
    //
    //Solution Description:
    //Treat the grid as graph, potentally containing multiple unconnected subgraphs. Iterate through the graph until we find
    //land (cell containing `1`). Once we have found land we need to find all land that is connected with it. Using DFS we
    //traverse the graph from this land cell and find all connected land using relative indexing. To ensure that we don't go
    //back over already discovered land we keep track of it using a `visited` set. Once we have exhasuatd all land connected
    //to this first discovered land we increase the island count and and try to find unexplored land by continuing to loop
    //through the grid.
    //
    //N.B: This graph can have multiple unconnected subgraphs so we need to perform multiple DFSs
    static func numIslands(_ grid: [[String]]) -> Int {
        //0 - sea, 1 - land
        var visited = Set<[Int]>()
        var islandCount = 0
        
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if grid[i][j] == "1" && !visited.contains([i, j]) {
                    dfs(grid: grid, root: [i, j], visited: &visited)
                    islandCount += 1
                }
            }
        }
        
        return islandCount
    }
    
    private static func dfs(grid: [[String]], root: [Int], visited: inout Set<[Int]>) {
        let neighbors = unvisitedLandNeighbors(grid, root[0], root[1], relativeIndexing, visited)
        for neighbor in neighbors {
            guard !visited.contains(neighbor) else {
                continue
            }

            visited.insert(neighbor)

            dfs(grid: grid, root: neighbor, visited: &visited)
        }
    }
    
    private static func dfsIterative(grid: [[String]], root: [Int], visited: inout Set<[Int]>) {
        var stack = [root]
        
        while !stack.isEmpty {
            let node = stack.removeLast()

            let neighbors = unvisitedLandNeighbors(grid, node[0], node[1], relativeIndexing, visited)
            for neighbor in neighbors {
                guard !visited.contains(neighbor) else {
                    continue
                }

                stack.append(neighbor)
                visited.insert(neighbor)
            }
        }
    }
    
    //Time: O(m * n) where m is the number of rows in grid
    //               where n is the number of columns
    //Space: O(m * n)
    //graph theory
    //BFS
    //relative indexing
    //matrix
    //subgraphs
    //
    //Solution Description:
    //Treat the grid as graph, potentally containing multiple unconnected subgraphs. Iterate through the graph until we find
    //land (cell containing `1`). Once we have found land we need to find all land that is connected with it. Using BFS we
    //traverse the graph from this land cell and find all connected land using relative indexing. To ensure that we don't go
    //back over already discovered land we keep track of it using a `visited` set. Once we have exhasuatd all land connected
    //to this first discovered land we increase the island count and and try to find unexplored land by continuing to loop
    //through the grid.
    //
    //N.B: This graph can have multiple unconnected subgraphs so we need to perform multiple BFSs
    static func numIslandsBFS(_ grid: [[String]]) -> Int {
        //0 - sea, 1 - land
        var visited = Set<[Int]>()
        var islandCount = 0
        
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if grid[i][j] == "1" && !visited.contains([i, j]) { //land
                    bfs(grid, [i, j], &visited) //use BFS to find contiguous land mass
                    islandCount += 1
                }
            }
        }
        
        return islandCount
    }
    
    private static func bfs(_ grid: [[String]], _ root: [Int], _ visited: inout Set<[Int]>) {
        var queue = [root]
        
        while !queue.isEmpty {
            var newQueueItems = [[Int]]()
            
            for vertice in queue {
                //check that since adding this vertice to the queue we haven't already processed it
                guard !visited.contains(vertice) else {
                    continue
                }
                visited.insert(vertice)
                
                let neighbors = unvisitedLandNeighbors(grid, vertice[0], vertice[1], relativeIndexing, visited)
                for neighbor in neighbors {
                    newQueueItems.append(neighbor)
                }
            }
            
            queue = newQueueItems
        }
    }
    
    // MARK: - Neighbors
    
    private static func unvisitedLandNeighbors(_ grid: [[String]], _ row: Int, _ column: Int, _ relativeIndexing: [[Int]], _ visited: Set<[Int]>) -> [[Int]] {
        var neighbors = [[Int]]()
        for relativeIndex in relativeIndexing {
            let relativeRow = row - relativeIndex[0]
            let relativeColumn = column - relativeIndex[1]
            
            guard relativeRow >= 0, relativeColumn >= 0, relativeRow < grid.count, relativeColumn < grid[0].count else {
                continue
            }
            
            guard !visited.contains([relativeRow, relativeColumn]) else {
                continue
            }
            
            guard grid[relativeRow][relativeColumn] == "1" else { //only interested in land
                continue
            }
            
            neighbors.append([relativeRow, relativeColumn])
        }
        
        return neighbors
    }
}
