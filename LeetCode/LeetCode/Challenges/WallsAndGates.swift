//
//  WallsAndGates.swift
//  LeetCode
//
//  Created by William Boles on 12/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/walls-and-gates/
struct WallsAndGates {
    
    //Time: O(n * m) where n is number for row in `rooms`
    //               where m is the number of columns in `rooms`
    //Space: O(n * m)
    //graph theory
    //BFS
    //multi-source
    //relative indexing
    //matrix
    //mutating
    //
    //Solution Description:
    //This is a graph problem. First we determine where (if) the gates are in the grid. These gates are then used as the starting
    //elements in our BFS queue (multi-source BFS). As we process the queue we use a 4-way relative mapping array to determine
    //which nodes are neighbors to the current node. From those neighbors we are only interested in rooms - which we determine by
    //checking if they are of value greater than `0`. For every room discovered we check if it's count is greater than our path
    //count (it's possible this room is nearer another gate than the gate we came from). If it is greater we update it with our
    //path count and add it the queue; if not greater we skip it.
    //
    //NB: As this is a graph rather than a binary tree, the BFS contains 3 loops rather than 2. The extra loop is to work through
    //the neighbors of a nodes - don't confuse this with the actual level traversal loop which is the second loop.
    //
    //NB: No need for a visited set as `rooms` acts as that as it updated with each iteration.
    func wallsAndGates(_ rooms: inout [[Int]]) {
        //-1 - wall, 0 - gate , INF - room
        
        var queue = [[Int]]()
        //find gates
        for i in 0..<rooms.count { //n * m
            for j in 0..<rooms[i].count {
                if rooms[i][j] == 0 {
                    queue.append([i, j])
                }
            }
        }
        
        // swiftlint:disable comma
        let relativeIndexing = [       [-1, 0], //[row, column]
                                [0, -1],     [0, 1],
                                       [1, 0]]
        // swiftlint:enable comma
        
        //update rooms
        while !queue.isEmpty {
            var newQueueItems = [[Int]]()
            
            for room in queue {
                //as a gate has the value of 0 (and any rooms after will be 0 + n)
                //we can just use the value of the room without needing to introduce
                //a new count
                let newDistance = rooms[room[0]][room[1]] + 1
                
                let neighbors = navigatableNeighbors(rooms, room[0], room[1], relativeIndexing)
                
                for neighbor in neighbors {
                    if rooms[neighbor[0]][neighbor[1]] > newDistance {
                        rooms[neighbor[0]][neighbor[1]] = newDistance
                        newQueueItems.append([neighbor[0], neighbor[1]])
                    }
                }
            }
            
            queue = newQueueItems
        }
    }
    
    private func navigatableNeighbors(_ rooms: [[Int]], _ row: Int, _ column: Int, _ relativeIndexing: [[Int]]) -> [[Int]] {
        var neighbors = [[Int]]()
        for relativeIndex in relativeIndexing {
            let relativeRow = row + relativeIndex[0]
            let relativeColumn = column + relativeIndex[1]
            
            guard relativeRow >= 0, relativeColumn >= 0, relativeRow < rooms.count, relativeColumn < rooms[0].count else {
                continue
            }
            
            guard rooms[relativeRow][relativeColumn] > 0 else { //is a room
                continue
            }
            
            neighbors.append([relativeRow, relativeColumn])
        }
        
        return neighbors
    }
}
