// Created 31/05/2025.

import Foundation

//https://leetcode.com/problems/minesweeper/
struct Minesweeper {
    
    //Time: O(n * m) where n is the number of rows in `board`
    //               where m is the number of columns `board`
    //Space: O(n * m)
    //matrix
    //graph theory
    //DFS
    //recursive
    //inline
    //marking
    //relative indexing
    //
    //Solution Description:
    //Treating `board` as a graph we use DFS to iterate through the graph and update the elements encountered. It is only
    //possible to move on from an `E` element if that element has no adjacent mines. Using relative indexing we determine if
    //there are adjacent mines by searching that elements neighbors (note we are not performing a DFS here - we only want the
    //immediate neighbors mine count). If an element has adjacent mines we update it with the count of those mines and don't
    //proceed any deeper from that element. If an `E` element has no adjacent mines we update with `B` and move onto that
    //element's neighbors. We repeat this process until all valid search paths have been exhausted and can return `board`.
    func updateBoard(_ board: [[Character]], _ click: [Int]) -> [[Character]] {
        var board = board
        let row = click[0]
        let column = click[1]

        guard board[row][column] != "M" else {
            board[row][column] = "X"
            return board
        }
    
        let relativeIndexes = [
            [-1, -1], [-1, 0], [-1, 1],
            [0, -1],           [0, 1],
            [1, -1],  [1, 0],  [1, 1]
        ]
        
        dfs(&board, row, column, relativeIndexes)
        
        return board
    }
    
    private func dfs(_ board: inout [[Character]], _ row: Int, _ column: Int, _ relativeIndexes: [[Int]]) {
        guard row >= 0, row < board.count, column >= 0, column < board[row].count else {
            return
        }
        
        guard board[row][column] == "E" else {
            return
        }
        
        let mineCount = nighborMineCount(board, row, column, relativeIndexes)
        
        if mineCount == 0 {
            board[row][column] = "B"
            
            for relativeIndex in relativeIndexes {
                let neighborRow = row + relativeIndex[0]
                let neighborColumn = column + relativeIndex[1]
                
                dfs(&board, neighborRow, neighborColumn, relativeIndexes)
            }
        } else {
            board[row][column] = Character("\(mineCount)")
        }
    }
    
    private func nighborMineCount(_ board: [[Character]], _ row: Int, _ column: Int, _ relativeIndexes: [[Int]]) -> Int {
        var mineCount = 0
        
        for relativeIndex in relativeIndexes {
            let neighborRow = row + relativeIndex[0]
            let neighborColumn = column + relativeIndex[1]
            
            guard neighborRow >= 0, neighborRow < board.count, neighborColumn >= 0, neighborColumn < board[neighborRow].count else {
                continue
            }
            
            if board[neighborRow][neighborColumn] == "M" {
                mineCount += 1
            }
        }
        
        return mineCount
    }
    
    //Time: O(n * m) where n is the number of rows in `board`
    //               where m is the number of columns `board`
    //Space: O(n * m)
    //matrix
    //graph theory
    //BFS
    //iterative
    //inline
    //marking
    //visited
    //relative indexing
    //
    //Solution Description:
    //Treating `board` as a graph we use BFS to iterate through the graph and update the elements encountered. It is only
    //possible to move on from an `E` element if that element has no adjacent mines. Using relative indexing we determine if
    //there are adjacent mines by searching that elements neighbors (note we immediately add the neighbors we encounter to
    //`nextIteration` as we don't yet know if the current element can be moved on from). If an element has adjacent mines we
    //update it with the count of those mines and don't proceed any deeper from that element. If an `E` element has no
    //adjacent mines we update with `B` and move onto that element's neighbors. To adding the same element to the BFS queue
    //we use a visited set to know if we hae already seen that element. We repeat this process until all valid search paths
    //have been exhausted and can return `board`.
    func updateBoard2(_ board: [[Character]], _ click: [Int]) -> [[Character]] {
        var board = board
        let row = click[0]
        let column = click[1]

        guard board[row][column] != "M" else {
            board[row][column] = "X"
            return board
        }
    
        let relativeIndexes = [
            [-1, -1], [-1, 0], [-1, 1],
            [0, -1],           [0, 1],
            [1, -1],  [1, 0],  [1, 1]
        ]

        var visited = Set<[Int]>()

        var queue = [[Int]]()
        queue.append([row, column])
        visited.insert([row, column])

        while !queue.isEmpty {
            var nextIteration = [[Int]]()

            for item in queue {
                let row = item[0]
                let column = item[1]

                var totalMines = 0
                var neighbors = [[Int]]()
                for relativeIndex in relativeIndexes {
                    let neighborRow = row + relativeIndex[0]
                    let neighborColumn = column + relativeIndex[1]

                    guard neighborRow >= 0, neighborRow < board.count, neighborColumn >= 0, neighborColumn < board[neighborRow].count else {
                        continue
                    }

                    guard !visited.contains([neighborRow, neighborColumn]) else {
                        continue
                    }

                    guard board[neighborRow][neighborColumn] != "M" else {
                        totalMines += 1
                        continue
                    }

                    neighbors.append([neighborRow, neighborColumn])
                }

                if totalMines == 0 {
                    visited.formUnion(neighbors)
                    nextIteration += neighbors
                    board[row][column] = "B"
                } else {
                    board[row][column] = Character("\(totalMines)")
                }
            }

            queue = nextIteration
        }

        return board
    }
}
