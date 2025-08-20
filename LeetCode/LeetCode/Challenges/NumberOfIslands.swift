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
    
    //Time: O(m * n) where m is the number of rows in `grid`
    //               where n is the number of columns in `grid`
    //Space: O(m * n)
    //graph theory
    //DFS
    //recursive
    //relative indexing
    //matrix
    //subgraphs
    //disconnected
    //negative marking
    //
    //Solution Description:
    //Treat the grid as graph, potentially containing multiple unconnected subgraphs. Iterate through the graph until we find
    //land (element containing `1`). Once we have found land we need to find all land that is connected with it. Using DFS we
    //traverse the graph from this land element and find all connected land using relative indexing. To ensure that we don't
    //revisit elements we overwrite the current elements value with `0`. Once we have exhausted all land elements on the island
    //we increase the island count and try to find unexplored land by continuing to loop through the grid.
    //
    //N.B: This graph can have multiple unconnected subgraphs so we need to perform multiple DFSs
    //
    //Similar to: https://leetcode.com/problems/number-of-connected-components-in-an-undirected-graph/
    //Similar to: https://leetcode.com/problems/number-of-distinct-islands/
    func numIslands(_ grid: [[Character]]) -> Int {
        var islands = 0
        var grid = grid
        
        for row in 0..<grid.count {
            for column in 0..<grid[0].count {
                if grid[row][column] == "1" {
                    dfs(&grid, row, column)
                    islands += 1
                }
            }
        }
        
        return islands
    }
    
    private func dfs(_ grid: inout [[Character]], _ row: Int, _ column: Int) {
        guard row >= 0, row < grid.count, column >= 0, column < grid[0].count else {
            return
        }
        
        guard grid[row][column] == "1" else {
            return
        }
        grid[row][column] = "0"
        
        //relative indexing
        dfs(&grid, row - 1, column)
        dfs(&grid, row + 1, column)
        dfs(&grid, row, column - 1)
        dfs(&grid, row, column + 1)
    }
    
    //Time: O(m * n) where m is the number of rows in `grid`
    //               where n is the number of columns in `grid`
    //Space: O(m * n)
    //graph theory
    //DFS
    //recursive
    //relative indexing
    //matrix
    //subgraphs
    //disconnected
    //visited
    //
    //Solution Description:
    //Treat the grid as graph, potentially containing multiple unconnected subgraphs. Iterate through the graph until we find
    //land (element containing `1`). Once we have found land we need to find all land that is connected with it. Using DFS we
    //traverse the graph from this land cell and find all connected land using relative indexing. To ensure that we don't go
    //back over already discovered land we keep track of it using a `visited` set. Once we have exhausted all land connected
    //to this first discovered land we increase the island count and try to find unexplored land by continuing to loop
    //through the grid.
    //
    //N.B: This graph can have multiple unconnected subgraphs so we need to perform multiple DFSs
    func numIslands2(_ grid: [[Character]]) -> Int {
        var islands = 0
        var visited = Set<[Int]>()
        
        for row in 0..<grid.count {
            for column in 0..<grid[0].count {
                if !visited.contains([row, column]) && grid[row][column] == "1" {
                    dfs(grid, row, column, &visited)
                    islands += 1
                }
            }
        }
        
        return islands
    }
    
    private func dfs(_ grid: [[Character]], _ row: Int, _ column: Int, _ visited: inout Set<[Int]>) {
        guard row >= 0, row < grid.count, column >= 0, column < grid[0].count else {
            return
        }
        
        guard grid[row][column] == "1" else {
            return
        }
        
        guard !visited.contains([row, column]) else {
            return
        }
        visited.insert([row, column])
        
        //relative indexing
        dfs(grid, row - 1, column, &visited)
        dfs(grid, row + 1, column, &visited)
        dfs(grid, row, column - 1, &visited)
        dfs(grid, row, column + 1, &visited)
    }
    
    //Time: O(m * n) where m is the number of rows in `grid`
    //               where n is the number of columns in `grid`
    //Space: O(m * n)
    //graph theory
    //DFS
    //recursive
    //relative indexing
    //matrix
    //subgraphs
    //disconnected
    //visited
    //
    //Solution Description:
    //Treat the grid as graph, potentially containing multiple unconnected subgraphs. Iterate through the graph until we find
    //land (element containing `1`). Once we have found land we need to find all land that is connected with it. Using DFS we
    //traverse the graph from this land cell and find all connected land using relative indexing. To ensure that we don't go
    //back over already discovered land we keep track of it using a `visited` set. Once we have exhausted all land connected
    //to this first discovered land we increase the island count and try to find unexplored land by continuing to loop
    //through the grid.
    //
    //N.B: This graph can have multiple unconnected subgraphs so we need to perform multiple DFSs
    func numIslands3(_ grid: [[Character]]) -> Int {
        var visited = Set<[Int]>()
        var count = 0

        for r in 0..<grid.count {
            for c in 0..<grid[r].count {
                if dfs3(grid, r, c, &visited) {
                    count += 1
                }
            }
        }

        return count
    }

    private func dfs3(_ grid: [[Character]], _ r: Int, _ c: Int, _ visited: inout Set<[Int]>) -> Bool {
        guard r >= 0, r < grid.count, c >= 0, c < grid[r].count else {
            return false
        }

        guard !visited.contains([r, c]), grid[r][c] == "1" else {
            return false
        }
        visited.insert([r, c])

        _ = dfs3(grid, r + 1, c, &visited)
        _ = dfs3(grid, r - 1, c, &visited)
        _ = dfs3(grid, r, c + 1, &visited)
        _ = dfs3(grid, r, c - 1, &visited)

        return true
    }
    
    //Time: O(m * n) where m is the number of rows in `grid`
    //               where n is the number of columns in `grid`
    //Space: O(m * n)
    //graph theory
    //DFS
    //recursive
    //relative indexing
    //matrix
    //subgraphs
    //disconnected
    //visited
    //
    //Solution Description:
    //Treat the grid as graph, potentially containing multiple unconnected subgraphs. Iterate through the graph until we find
    //land (cell containing `1`). Once we have found land we need to find all land that is connected with it. Using DFS we
    //traverse the graph from this land cell and find all connected land using relative indexing. To ensure that we don't go
    //back over already discovered land we keep track of it using a `visited` set. Once we have exhausted all land connected
    //to this first discovered land we increase the island count and and try to find unexplored land by continuing to loop
    //through the grid.
    //
    //N.B: This graph can have multiple unconnected subgraphs so we need to perform multiple DFSs
    func numIslands4(_ grid: [[Character]]) -> Int {
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
    
    private func dfs(grid: [[Character]], root: [Int], visited: inout Set<[Int]>) {
        // swiftlint:disable comma
        let relativeIndexing = [      [-1, 0],
                                [0, -1],     [0, 1],
                                      [1, 0]]
        // swiftlint:enable comma
        
        let neighbors = unvisitedLandNeighbors(grid, root[0], root[1], relativeIndexing, visited)
        for neighbor in neighbors {
            guard !visited.contains(neighbor) else {
                continue
            }
            
            visited.insert(neighbor)
            
            dfs(grid: grid, root: neighbor, visited: &visited)
        }
    }
    
    //Time: O(m * n) where m is the number of rows in `grid`
    //               where n is the number of columns in `grid`
    //Space: O(m * n)
    //graph theory
    //DFS
    //iterative
    //relative indexing
    //matrix
    //subgraphs
    //disconnected
    //visited
    //
    //Solution Description:
    //Treat the grid as graph, potentially containing multiple unconnected subgraphs. Iterate through the graph until we find
    //land (cell containing `1`). Once we have found land we need to find all land that is connected with it. Using DFS we
    //traverse the graph from this land cell and find all connected land using relative indexing. To ensure that we don't go
    //back over already discovered land we keep track of it using a `visited` set. Once we have exhausted all land connected
    //to this first discovered land we increase the island count and and try to find unexplored land by continuing to loop
    //through the grid.
    //
    //N.B: This graph can have multiple unconnected subgraphs so we need to perform multiple DFSs
    func numIslands5(_ grid: [[Character]]) -> Int {
        //0 - sea, 1 - land
        var visited = Set<[Int]>()
        var islandCount = 0
        
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if grid[i][j] == "1" && !visited.contains([i, j]) {
                    dfsIterative(grid: grid, root: [i, j], visited: &visited)
                    islandCount += 1
                }
            }
        }
        
        return islandCount
    }
    
    private func dfsIterative(grid: [[Character]], root: [Int], visited: inout Set<[Int]>) {
        // swiftlint:disable comma
        let relativeIndexing = [      [-1, 0],
                                [0, -1],     [0, 1],
                                      [1, 0]]
        // swiftlint:enable comma
        
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
    
    //Time: O(m * n) where m is the number of rows in `grid`
    //               where n is the number of columns in `grid`
    //Space: O(m * n)
    //graph theory
    //BFS
    //relative indexing
    //matrix
    //subgraphs
    //disconnected
    //
    //Solution Description:
    //Treat the grid as graph, potentially containing multiple unconnected subgraphs. Iterate through the graph until we find
    //land (cell containing `1`). Once we have found land we need to find all land that is connected with it. Using BFS we
    //traverse the graph from this land cell and find all connected land using relative indexing. To ensure that we don't go
    //back over already discovered land we keep track of it using a `visited` set. Once we have exhausted all land connected
    //to this first discovered land we increase the island count and and try to find unexplored land by continuing to loop
    //through the grid.
    //
    //N.B: This graph can have multiple unconnected subgraphs so we need to perform multiple BFSs
    func numIslands6(_ grid: [[Character]]) -> Int {
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
    
    private func bfs(_ grid: [[Character]], _ root: [Int], _ visited: inout Set<[Int]>) {
        // swiftlint:disable comma
        let relativeIndexing = [      [-1, 0],
                                [0, -1],     [0, 1],
                                      [1, 0]]
        // swiftlint:enable comma
        
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
    
    private func unvisitedLandNeighbors(_ grid: [[Character]], _ row: Int, _ column: Int, _ relativeIndexing: [[Int]], _ visited: Set<[Int]>) -> [[Int]] {
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
