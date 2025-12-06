// Created 15/12/2021.

import Foundation

//https://leetcode.com/problems/01-matrix/
struct Matrix01 {
    
    //Time: O(m * n)
    //Space: O(m * n)
    //graph theory
    //BFS
    //relative indexing
    //matrix
    //multi-source
    //
    //Solution Description:
    //Treating `mat` as a graph where each vertice is connected to the vertices immediately above, below, left and
    //right. We first find where all the `0`s are in the graph, adding them to both `queue` and `visited`. We traverse
    //the graph in a BFS manner, checking each neighbor to see if it has a value of `1`, if it does we update that value
    //with the current `level` value and add it to both `queue` and `visited`. Once the queue is empty we have traversed
    //all possible vertices and can return the updated distance array.
    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        var distances = mat
        
        var queue = [[Int]]()
        var visited = Set<[Int]>()
        
        for i in 0..<mat.count {
            for j in 0..<mat[i].count {
                if mat[i][j] == 0 {
                    queue.append([i, j])
                    visited.insert([i, j])
                }
            }
        }
        
        // swiftlint:disable comma
        let relativeIndexing = [      [-1, 0],
                                [0, -1],    [0, 1],
                                      [1, 0]] //[row, column]
        // swiftlint:enable comma
        
        var level = 1
        
        while !queue.isEmpty {
            var newQueueItems = [[Int]]()
            
            for coords in queue {
                let neighbors = visitableNeighbors(mat, coords[0], coords[1], visited, relativeIndexing)
                for neighbor in neighbors {
                    guard !visited.contains(neighbor) else {
                        continue
                    }
                    
                    if mat[neighbor[0]][neighbor[1]] == 1 {
                        distances[neighbor[0]][neighbor[1]] = level
                    }
                    
                    visited.insert(neighbor)
                    newQueueItems.append(neighbor)
                }
            }
            
            queue = newQueueItems
            
            level += 1
        }
        
        return distances
    }

    private func visitableNeighbors(_ mat: [[Int]], _ row: Int, _ column: Int, _ visited: Set<[Int]>, _ relativeIndexing: [[Int]]) -> [[Int]] {
        var neighbors = [[Int]]()
        
        for relativeIndex in relativeIndexing {
            let relativeRow = row - relativeIndex[0]
            let relativeColumn = column - relativeIndex[1]
            
            guard relativeRow >= 0, relativeColumn >= 0, relativeRow < mat.count, relativeColumn < mat[row].count else {
                continue
            }
            
            guard !visited.contains([relativeRow, relativeColumn]) else {
                continue
            }
            
            neighbors.append([relativeRow, relativeColumn])
        }
        
        return neighbors
    }
}
