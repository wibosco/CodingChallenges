//
//  ShortestPathBinaryMatrix.swift
//  CodingChallenges
//
//  Created by William Boles on 06/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/shortest-path-in-binary-matrix/
//graph theory
struct ShortestPathBinaryMatrix {
    
    //Time: O(n)
    //Space: O(n)
    //BFS
    //relative indexing
    //
    //Solution Description:
    //Treat the matrix as a graph with each "touching" nodes being a neighbor. "Touching" is defined
    //by using relative indexing from the [row][column] position that is being checked i.e. all 8
    //nodess around - careful to check for out of bounds and if that nodes is navigatable i.e. 0 value.
    //Using BFS we then traverse through the neighbours of each nodes until we either find the
    //target (bottom right) or we run out of neighbours. To prevent an infinite search, any visited
    //nodess we insert into a `visited` set.
    static func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
        guard !grid.isEmpty else {
            return -1
        }
        
        let rowsCount = grid.count
        let columnCount = grid[0].count
        
        //start and end need to be valid i.e. val = 0
        guard grid[0][0] == 0, grid[(rowsCount - 1)][(columnCount - 1)] == 0 else {
            return -1
        }
        
        //start is the end
        guard (rowsCount - 1) != 0, (columnCount - 1) != 0 else {
            return 1
        }
        
        let relativeIndexing = [[-1,-1], [-1, 0], [-1, 1],
                                [0, -1],          [0, 1],
                                [1, -1], [1, 0],  [1, 1]]
        
        var queue = [(rowColumn: [0, 0], count: 1)] //[row, column], count
        var visited = Set<[Int]>()
        
        let target = [(rowsCount - 1), (columnCount - 1)]
        
        while !queue.isEmpty {
            let dq = queue.removeFirst()
            let rowColumn = dq.rowColumn
            let count = dq.count
            
            guard !visited.contains(rowColumn) else {
                continue
            }
            
            visited.insert(rowColumn)
            
            let neighbors = validNeighbors(grid: grid, relativeIndexing: relativeIndexing, row: rowColumn[0], column: rowColumn[1])
            
            for neighbor in neighbors {
                guard neighbor != target else {
                    return count + 1
                }
                
                queue.append((neighbor, (count + 1)))
            }
        }
        
        return -1
    }
    
    private static func validNeighbors(grid: [[Int]], relativeIndexing: [[Int]], row: Int, column: Int) -> [[Int]] {
        var neighbors = [[Int]]()
        for relativeIndex in relativeIndexing {
            let relativeRow = row + relativeIndex[0]
            let relativeColumn = column + relativeIndex[1]
            
            guard relativeRow >= 0, relativeColumn >= 0, relativeRow < grid[0].count, relativeColumn < grid.count else {
                continue
            }
            
            guard grid[relativeRow][relativeColumn] == 0 else {
                continue
            }
            
            neighbors.append([relativeRow, relativeColumn])
        }
        
        return neighbors
    }
    
    //Time: O(n)
    //Space: O(n)
    //BFS
    //adjacent list
    //
    //Solution Description:
    //Treat the matrix as a graph with each "touching" nodes being a neighbor. "Touching" is defined
    //by using relative indexing from the [row][column] position that is being checked i.e. all 8
    //nodess around - careful to check for out of bounds and if that nodes is navigatable i.e. 0 value.
    //Gradually build up an adjacent list for all ndoes in the graph, using BFS we then traverse
    //through the neighbors until we either find the target (bottom right) or we run out of neighbours.
    //To prevent an infinite search, any visited nodess we insert into a `visited` set.
    static func shortestPathBinaryMatrixLongWay(_ grid: [[Int]]) -> Int {
        guard !grid.isEmpty else {
            return -1
        }
        
        //check start and end are not 1
        guard grid[0][0] != 1, grid[(grid.count - 1)][(grid[0].count - 1)] != 1 else {
            return -1
        }
        
        //build graph
        
        let columnCount = grid[0].count
        let totalCount = grid.count * columnCount
        
        var adjList = Array(repeating: [Int](), count: totalCount)
        
        var previousRowIndex = -1
        var currentRowIndex = 0
        var nextRowIndex = 1
        
        while currentRowIndex < grid.count {
            var previousRow: [Int]?
            if previousRowIndex >= 0 {
                previousRow = grid[previousRowIndex]
            }
            
            let currentRow = grid[currentRowIndex]
            
            var nextRow: [Int]?
            if nextRowIndex < grid.count {
                nextRow = grid[nextRowIndex]
            }
            
            for i in 0..<currentRow.count {
                guard currentRow[i] != 1 else {
                    continue
                }
                
                let currentRowOffset = columnCount * currentRowIndex
                let nodeIndex = currentRowOffset + i
                
                if let previousRow = previousRow {
                    let previousRowOffset = columnCount * previousRowIndex
                    if (i - 1) >= 0 {
                        if previousRow[(i - 1)] == 0 {
                            adjList[nodeIndex].append((previousRowOffset + (i - 1)))
                        }
                    }
                    
                    if previousRow[i] == 0 {
                        adjList[nodeIndex].append((previousRowOffset + i))
                    }
                    
                    
                    if (i + 1) < currentRow.count {
                        if previousRow[(i + 1)] == 0 {
                            adjList[nodeIndex].append((previousRowOffset + (i + 1)))
                        }
                    }
                }
                
                if (i - 1) >= 0 {
                    if currentRow[(i - 1)] == 0 {
                        adjList[nodeIndex].append((currentRowOffset + (i - 1)))
                    }
                }
                
                if (i + 1) < currentRow.count {
                    if currentRow[(i + 1)] == 0 {
                        adjList[nodeIndex].append((currentRowOffset + (i + 1)))
                    }
                }
                
                if let nextRow = nextRow {
                    let nextRowOffset = columnCount * nextRowIndex
                    if (i - 1) >= 0 {
                        if nextRow[(i - 1)] == 0 {
                            adjList[nodeIndex].append((nextRowOffset + (i - 1)))
                        }
                    }
                    
                    if nextRow[i] == 0 {
                        adjList[nodeIndex].append((nextRowOffset + i))
                    }
                    
                    
                    if (i + 1) < currentRow.count {
                        if nextRow[(i + 1)] == 0 {
                            adjList[nodeIndex].append((nextRowOffset + (i + 1)))
                        }
                    }
                }
            }
            
            previousRowIndex += 1
            currentRowIndex += 1
            nextRowIndex += 1
        }
        
        //bfs
        
        let target = (grid[0].count * grid.count) - 1
        var queue = [(0, 1)]
        var visited = Set<[Int]>(arrayLiteral: [0, 0])
        
        while !queue.isEmpty {
            let (curr, count) = queue.removeFirst()
            
            if curr == target {
                return count
            }
            
            for neighbor in adjList[curr] {
                let path = [curr, neighbor]
                if visited.contains(path) {
                    continue
                }
                
                visited.insert(path)
                
                queue.append((neighbor, (count + 1)))
            }
        }
        
        return -1
    }
}
