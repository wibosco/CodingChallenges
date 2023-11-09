//
//  RottingOranges.swift
//  LeetCode
//
//  Created by William Boles on 06/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/rotting-oranges/
struct RottingOranges {
    
    //Time: O(m * n) where m is the number of rows
    //               where n is the number of columns
    //Space: O(m * n) for `visited`
    //graph theory
    //BFS
    //multi-source
    //visited
    //relative indexing
    //matrix
    //
    //Solution Description:
    //This is a graph problem. First we determine where (if) the rotten oranges are in the grid and how many fresh oranges
    //we have. The rotten oranges are then used as the starting elements in our BFS queue. As we process the queue we use
    //4-way relative mapping array to determine which nodes are neighbors to the current node. From those neighbors we are
    //only interested in the fresh ones - which we determine by checking if they are of value `1` and also that we are not
    //in the `visited` array. The `visited` array contains the rotten nodes. For every fresh orange discovered we add it to
    //the `visited` array and reduce the `freshFruit' count. Each top level iteration of the loop is one level completed or
    //a "minute". Finally we check if all of the fresh oranges are rotten, if so we return the level count otherwise we
    //return -1.
    //
    //NB: As this is a graph rather than a binary tree, the BFS contains 3 loops rather than 2. The extra loop is to work
    //through the neighbors of a nodes - don't confuse this with the actual level traversal loop which is the second loop.
    static func orangesRotting(_ grid: [[Int]]) -> Int {
        //0 - empty, 1 - fresh, 2 - rotten
        var queue = [[Int]]()
        var freshFruit = 0
        
        //find the rotten fruit starting points
        for row in 0..<grid.count {
            for column in 0..<grid[0].count {
                let val = grid[row][column]
                if val == 1 {
                    freshFruit += 1
                } else if val == 2 {
                    queue.append([row, column])
                }
            }
        }
        
        //contains no fresh fruit as we got past the previous
        //guard we know it contains at least no rotting
        //fruit
        guard freshFruit != 0 else {
            return 0
        }
        
        //no rotten fruit
        guard !queue.isEmpty else {
            return -1
        }
        
        //rot spreading
        var spreadTime = 0
        var visited = [[Int]]() //can be thought of as containing all the rotten fruits (once processed)
        
        // swiftlint:disable comma
        let relativeIndexing = [        [-1, 0],
                                [0, -1],      [0, 1],
                                        [1, 0]] //[row, column]
        // swiftlint:enable comma
        
        while !queue.isEmpty {
            var newQueueItems = [[Int]]()
            
            for node in queue {
                let neighbors = navigatableNeighbors(grid, relativeIndexing, node[0], node[1], visited: visited)
                
                for neighbor in neighbors {
                    visited.append(neighbor)
                    
                    freshFruit -= 1
                    newQueueItems.append(neighbor)
                }
            }
            
            queue = newQueueItems
            
            spreadTime += 1
        }
        
        return freshFruit > 0 ? -1 : (spreadTime - 1)
    }
    
    private static func navigatableNeighbors(_ grid: [[Int]], _ relativeIndexing: [[Int]], _ row: Int, _ column: Int, visited: [[Int]]) -> [[Int]] {
        var neighbors = [[Int]]()
        for relativeIndex in relativeIndexing {
            let relativeRow = row + relativeIndex[0]
            let relativeColumn = column + relativeIndex[1]
            
            guard relativeRow >= 0, relativeColumn >= 0, relativeRow < grid.count, relativeColumn < grid[0].count else {
                continue
            }
            
            guard grid[relativeRow][relativeColumn] == 1 else { //only interested in "fresh"
                continue
            }
            
            guard !visited.contains([relativeRow, relativeColumn]) else {
                continue
            }
            
            neighbors.append([relativeRow, relativeColumn])
        }
        
        return neighbors
    }
    
    //Time: O(m * n) where m is the number of rows
    //               where n is the number of columns
    //Space: O(m * n) worse case if the queue is full as the grid only contains rotten oranges
    //graph theory
    //BFS
    //multi-source
    //mutating
    //relative indexing
    //matrix
    //
    //Solution Description:
    //This is a graph problem. First we determine where (if) the rotten oranges are in the
    //grid and how many fresh oranges we have. The rotten are then used as the starting
    //elements in our BFS queue (multi-source BFS). As we process the queue we use 4-way
    //relative mapping array to determine which nodes are neighbors to the current node.
    //From those neighbors we are only interested in the fresh ones - which we determine by
    //checking if they are of value `1`. For every fresh orange discovered we convert it
    //rotten in the grid and reduce the `freshFruit` count. Each top level iteration of the
    //loop is one level completed or 1 "minute". Finally we check if all of the fresh oranges
    //are rotten, if so we return the level count otherwise we return -1
    //
    //NB: As this is a graph rather than a binary tree, the BFS contains 3 loops rather than 2. The
    //extra loop is to work through the neighbors of a nodes - don't confuse this with the actual
    //level traversal loop which is the second loop
    static func orangesRottingMutating(_ grid: [[Int]]) -> Int {
        //0 - empty, 1 - fresh, 2 - rotten
        var queue = [[Int]]()
        var freshFruit = 0
        
        //find the rotten fruit starting points
        for row in 0..<grid.count {
            for column in 0..<grid[0].count {
                let val = grid[row][column]
                if val == 1 {
                    freshFruit += 1
                } else if val == 2 {
                    queue.append([row, column])
                }
            }
        }
        
        //contains no fresh fruit as we got past the previous
        //guard we know it contains at least no rotting
        //fruit
        guard freshFruit != 0 else {
            return 0
        }
        
        //no rotten fruit
        guard !queue.isEmpty else {
            return -1
        }
        
        //rot spreading
        var spreadTime = 0
        var mGrid = grid
        
        // swiftlint:disable comma
        let relativeIndexing = [        [-1, 0],
                                [0, -1],      [0, 1],
                                        [1, 0]] //[row, column]
        // swiftlint:enable comma
        
        while !queue.isEmpty {
            var newQueueItems = [[Int]]()
            
            for node in queue {
                let neighbors = navigatableFreshNeighborsMuting(mGrid, relativeIndexing, node[0], node[1])
                
                for neighbor in neighbors {
                    mGrid[neighbor[0]][neighbor[1]] = 2 //mutate to rotten
                    freshFruit -= 1
                    newQueueItems.append(neighbor)
                }
            }
            
            queue = newQueueItems
            
            spreadTime += 1
        }
        
        return freshFruit > 0 ? -1 : (spreadTime - 1)
    }
    
    private static func navigatableFreshNeighborsMuting(_ grid: [[Int]], _ relativeIndexing: [[Int]], _ row: Int, _ column: Int) -> [[Int]] {
        var neighbors = [[Int]]()
        for relativeIndex in relativeIndexing {
            let relativeRow = row + relativeIndex[0]
            let relativeColumn = column + relativeIndex[1]
            
            guard relativeRow >= 0, relativeColumn >= 0, relativeRow < grid.count, relativeColumn < grid[0].count else {
                continue
            }
            
            guard grid[relativeRow][relativeColumn] == 1 else { //only interested in "fresh"
                continue
            }
            
            neighbors.append([relativeRow, relativeColumn])
        }
        
        return neighbors
    }
}
