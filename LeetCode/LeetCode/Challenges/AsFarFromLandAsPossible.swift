// Created 30/10/2023.

import Foundation

//https://leetcode.com/problems/as-far-from-land-as-possible/
struct AsFarFromLandAsPossible {
    
    //Time: O(n * m) where n is the number of rows in `grid`
    //               where m is the number of columns in `grid`
    //Space: O(n * m)
    //graph theory
    //BFS
    //multi-source BFS
    //iterative
    //visited
    //set
    //array
    //level traversal
    //relative indexing
    //inverted thinking
    //
    //Solution Description:
    //Rather than starting with water and attempting to find land, we can flip the problem and instead start with land. Starting
    //with land will allow us to build in previous iterations of our BFS and so only perform one BFS (starting with water means
    //we need to perform a full BFS for each water square/element). As we are performing a BFS we know that any square previously
    //unsearched square we encountered is shortest/minimum path we could have taken from land to get there. First we add all
    //land squares to `queue` and `visited`. We then check for edge cases of no water and no land - if either are true we return
    //-1. Next we perform the BFS using relative indexing to determine where we can move to. By using a level-by-level BFS
    //traversal we are to keep track of how far the squares of water are from land - each level is one more removed from land.
    //To avoid re-searching already searched squares we add each square we encountered to the `visited` set. At the end of the
    //BFS we return `distance`.
    //
    //N.B Manhattan distance (|xi - xj| + |yi - yj|) is the distance between two squares as measured in vertical and/or
    //horizontal moves.
    func maxDistance(_ grid: [[Int]]) -> Int {
        let relativeIndexes = [[-1, 0], [1, 0], [0, -1], [0, 1]] //[up down left right]
        
        var queue = [[Int]]() //[[row, column]]
        var visited = Set<[Int]>() //[row, column]
        
        //find all land
        for row in 0..<grid.count {
            for column in 0..<grid[row].count {
                if grid[row][column] == 1 {
                    queue.append([row, column])
                    visited.insert([row, column])
                }
            }
        }
        
        guard !queue.isEmpty else {
            return -1 //no land
        }
        
        guard queue.count != (grid.count * grid[0].count) else {
            return -1 //no water
        }
        
        var distance = -1
        while !queue.isEmpty {
            var newQueue = [[Int]]()
            
            for index in queue {
                let row = index[0]
                let column = index[1]
                
                for relativeIndex in relativeIndexes {
                    let nextRow = row + relativeIndex[0]
                    let nextColumn = column + relativeIndex[1]
                    
                    guard nextRow >= 0, nextRow < grid.count, nextColumn >= 0, nextColumn < grid[nextRow].count else {
                        continue
                    }

                    guard !visited.contains([nextRow, nextColumn]) else {
                        continue
                    }
                    
                    visited.insert([nextRow, nextColumn])
                    newQueue.append([nextRow, nextColumn])
                }
            }
            
            distance += 1
            queue = newQueue
        }
        
        return distance
    }
    
    //Time: O((n * m) ^ 2) where n is the number of rows in `grid`
    //                     where m is the number of columns in `grid`
    //Space: O(n * m)
    //graph theory
    //BFS
    //iterative
    //visited
    //set
    //array
    //level traversal
    //relative indexing
    //
    //Solution Description:
    //We find each water square/element in `grid` and perform a BFS from square to all connected squares until we encounter
    //a land square. As we are performing a BFS we know that when we encounter land it is shortest/minimum path between those
    //two squares. We repeat this process for all water elements and store the most distant water square in `maxDistance`.
    //After searching performing a BFS from each water square we return `maxDistance`.
    //
    //N.B Manhattan distance (|xi - xj| + |yi - yj|) is the distance between two squares as measured in vertical and/or 
    //horizontal moves.
    func maxDistanceFromWater(_ grid: [[Int]]) -> Int {
        let relativeIndexes = [[-1, 0], [1, 0], [0, -1], [0, 1]] //[up down left right]
        
        var maxDistance = -1
        
        for row in 0..<grid.count {
            for column in 0..<grid[row].count {
                if grid[row][column] == 0 {
                    let distance = bfs(grid, row, column, relativeIndexes)
                        
                    maxDistance = max(maxDistance, distance)
                }
            }
        }
        
        return maxDistance
    }
    
    private func bfs(_ grid: [[Int]], _ srcRow: Int, _ srcColumn: Int, _ relativeIndexes: [[Int]]) -> Int {
        var visited = Set<[Int]>()
        visited.insert([srcRow, srcColumn])
        
        var distance = 0
        
        var queue = [[Int]]()
        queue.append([srcRow, srcColumn])
        
        while !queue.isEmpty {
            var newQueue = [[Int]]()
            
            for index in queue {
                let dstRow = index[0]
                let dstColumn = index[1]
                
                if grid[dstRow][dstColumn] == 1 {
                    return distance
                } else {
                    for relativeIndex in relativeIndexes {
                        let nextRow = dstRow + relativeIndex[0]
                        let nextColumn = dstColumn + relativeIndex[1]
                        
                        guard nextRow >= 0, nextRow < grid.count, nextColumn >= 0, nextColumn < grid[nextRow].count else {
                            continue
                        }

                        guard !visited.contains([nextRow, nextColumn]) else {
                            continue
                        }
                        
                        visited.insert([nextRow, nextColumn])
                        newQueue.append([nextRow, nextColumn])
                    }
                }
            }
            distance += 1
            queue = newQueue
        }
        
        return -1
    }
}
