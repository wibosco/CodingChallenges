// Created 12/12/2021.

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
    //inline
    //level-by-level
    //
    //Solution Description:
    //Treating the matrix as a graph we can use BFS to determine how far away a given cell is from it's nearest gate. Rather
    //than starting with each cell and working out the nearest gate we can instead go in reverse and start from each gate. To
    //do this we first need to find the gates by interating through every cell in `rooms` and adding those indexes with a
    //value of 0 to`gates`. We then iterate through `gates` and start a BFS from each index. As we are trying to find any
    //given cells nearest index each level iteration through the queue we increment `level` which is then used to mark the
    //cell. As it is possible for a multiple gates to be accessible to the same cell, we only mark a cell with level if that
    //level is a lower value than the correct cells value. If a cell has a value that is less than `level` we skip it i.e.
    //we don't add its neighbors to the queue. As we process the queue we use a 4-way relative mapping array to determine
    //which cells to add the queue next. We repeat this process for all reachable cells before moving on to the next gate.
    //Once all gates have acted as the source for a BFS we are completed.
    //
    //NB: No need for a visited set as `rooms` acts as that as it updated with each iteration.
    func wallsAndGates(_ rooms: inout [[Int]]) {
        var gates = [(Int, Int)]()

        for r in 0..<rooms.count {
            for c in 0..<rooms[r].count {
                guard rooms[r][c] == 0 else {
                    continue
                }

                gates.append((r, c))
            }
        }

        for gate in gates {
            var queue = [(Int, Int)]() //[(row, col)]
            
            //we alreay know that `gate` is a gate so start with it's neighbors
            queue.append((gate.0 + 1, gate.1))
            queue.append((gate.0 - 1, gate.1))
            queue.append((gate.0, gate.1 + 1))
            queue.append((gate.0, gate.1 - 1))

            var level = 1

            while !queue.isEmpty {
                var nextIteration = [(Int, Int)]()
                
                for (r, c) in queue {
                    guard r >= 0, r < rooms.count, c >= 0, c < rooms[r].count else {
                        continue
                    }

                    guard rooms[r][c] > level else {
                        continue
                    }

                    rooms[r][c] = level

                    nextIteration.append((r + 1, c))
                    nextIteration.append((r - 1, c))
                    nextIteration.append((r, c + 1))
                    nextIteration.append((r, c - 1))
                }

                queue = nextIteration
                level += 1
            }
        }
    }
    
    //Time: O(n * m) where n is number for row in `rooms`
    //               where m is the number of columns in `rooms`
    //Space: O(n * m)
    //graph theory
    //BFS
    //multi-source
    //relative indexing
    //matrix
    //mutating
    //inline
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
    func wallsAndGates2(_ rooms: inout [[Int]]) {
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
