// Created 15/12/2021.

import Foundation

//https://leetcode.com/problems/flood-fill/

struct FloodFill {
    
    //Time: O(m * n) where m is the number of rows
    //               where n the number of columns
    //Space: O(m * n)
    //graph theory
    //BFS
    //relative indexing
    //matrix
    //visited
    //iterative
    //
    //Solution Description:
    //Treating `image` as a graph where each vertice is connected to the vertices immediately above, below, left and
    //right. We traverse the graph from the starting position of `sr, sc` in a BFS manner, checking each neighbor to
    //test if it can be filled i.e. is the same color as `sr, sc` and hasn't visited before. If that neighbor we add it
    //to the queue and eventually convert it's color. Once the queue is empty we have traversed all possible vertices
    //from `sr, sc` and can return the updated image.
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        let relativeIndexing = [    [-1, 0],
                                [0, -1], [0, 1],
                                     [1, 0]
                                ] //[row, column]
        
        let oldColor = image[sr][sc]
        var newImage = image
        
        var queue = [[sr, sc]]
        var visited = Set<[Int]>(arrayLiteral: [sr, sc])
        
        while !queue.isEmpty {
            var newQueueItems = [[Int]]()
            
            for coords in queue {
                newImage[coords[0]][coords[1]] = newColor
                
                let neighbors = visitableNeighbors(image, coords[0], coords[1], oldColor, relativeIndexing, visited)
                for neighbor in neighbors {
                    visited.insert(neighbor)
                    newQueueItems.append(neighbor)
                }
            }
            
            queue = newQueueItems
        }
        
        return newImage
    }
    
    //Time: O(m * n) where m is the number of rows
    //               where n the number of columns
    //Space: O(m * n)
    //graph theory
    //DFS
    //relative indexing
    //matrix
    //visited
    //recursive
    //
    //Solution Description:
    //Treating `image` as a graph where each vertice is connected to the vertices immediately above, below, left and
    //right. We traverse the graph from the starting position of `sr, sc` in a DFS manner, checking each neighbor to
    //test if it can be filled i.e. is the same color as `sr, sc` and hasn't visited before. If that neighbor we add it
    //to the queue and eventually convert it's color. Once the queue is empty we have traversed all possible vertices
    //from `sr, sc` and can return the updated image.
    func floodFillDFS(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        let oldColor = image[sr][sc]
        var newImage = image
        
        var visited = Set<[Int]>(arrayLiteral: [sr, sc])
        
        dfs(&newImage, sr, sc, newColor, oldColor, &visited)
        
        return newImage
    }
    
    private func dfs(_ image: inout [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int, _ oldColor: Int, _ visited: inout Set<[Int]>) {
        let relativeIndexing = [[-1, 0], [0, -1], [0, 1], [1, 0]] //[row, column]
        
        image[sr][sc] = newColor
        
        let neighbors = visitableNeighbors(image, sr, sc, oldColor, relativeIndexing, visited)
        for neighbor in neighbors {
            visited.insert(neighbor)
            dfs(&image, neighbor[0], neighbor[1], newColor, oldColor, &visited)
        }
    }
    
    // MARK: - Neighbors
    
    private func visitableNeighbors(_ image: [[Int]], _ sr: Int, _ sc: Int, _ oldColor: Int, _ relativeIndexing: [[Int]], _ visited: Set<[Int]>) -> [[Int]] {
        var neighbors = [[Int]]()
        
        for relativeIndex in relativeIndexing {
            let relativeRow = sr - relativeIndex[0]
            let relativeColumn = sc - relativeIndex[1]
            
            guard relativeRow >= 0, relativeColumn >= 0, relativeRow < image.count, relativeColumn < image[sr].count else {
                continue
            }
            
            guard image[relativeRow][relativeColumn] == oldColor else {
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
