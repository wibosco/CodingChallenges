//
//  GameOfLife.swift
//  LeetCode
//
//  Created by William Boles on 13/04/2022.
//

import Foundation

//https://leetcode.com/problems/game-of-life/

struct GameOfLife {
    
    //Time: O(n * m) where n is the number of rows
    //               where m is the the number of columns
    //Space: O(n * m)
    //matrix
    //relative indexing
    //multi-source
    //
    //Solution Description:
    //Iterate through `board` and using relative indexing determine the state of cells surrounding each cell. We then
    //record the changes to that cell in a new board `nextBoard` so that the changes that we make don't affect any
    //unprocessed cells on the original board - `board`.
    func gameOfLife(_ board: inout [[Int]]) {
        var nextBoard = Array(repeating: Array(repeating: 0, count: board[0].count), count: board.count)
        
        // swiftlint:disable comma
        let relativeIndexing = [[-1, -1], [-1, 0], [-1, 1],
                                [0, -1],           [0, 1],
                                [1, -1], [1, 0], [1, 1]]
        // swiftlint:enable comma
        
        for row in 0..<board.count {
            for column in 0..<board[row].count {
                let outcome = update(board, row, column, relativeIndexing)
                
                nextBoard[row][column] = outcome
            }
        }
        
        board = nextBoard
    }
    
    private func update(_ board: [[Int]], _ row: Int, _ column: Int, _ relativeIndexing: [[Int]]) -> Int {
        let isAlive = board[row][column] == 1
        var liveNeighbors = 0
        
        for relativeIndex in relativeIndexing {
            let newRow = row + relativeIndex[0]
            let newColumn = column + relativeIndex[1]
            
            guard newRow >= 0, newRow < board.count else {
                continue
            }
            
            guard newColumn >= 0, newColumn < board[newRow].count else {
                continue
            }
            
            if board[newRow][newColumn] == 1 {
                liveNeighbors += 1
            }
        }
        
        var outcome = 0
        
        if isAlive {
            if liveNeighbors < 2 {
                outcome = 0
            } else if liveNeighbors < 4 {
                outcome = 1
            } else {
                outcome = 0
            }
        } else {
            if liveNeighbors == 3 {
                outcome = 1
            }
        }
        
        return outcome
    }
}
