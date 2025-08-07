// Created 07/08/2025.

import Foundation

//https://leetcode.com/problems/design-tic-tac-toe/
//design
//matrix
//array
//graph theory
//DFS
//recursive
//relative indexing
//
//Solution Description:
//Treating the board as a graph we can traverse through it after each move using relative indexing to determine if a player has
//won or not. As there are four ways to win, we perform up to 4 traversals per move. We count how many index are filled with the
//players marker on each traversal, if the count is equal to the length of the board then we know that the player has filled in
//an entire row, column or diagonal and has won the game.
class TicTacToe {
    private var board: [[String]]
    
    init(_ n: Int) {
        self.board = Array(repeating: Array(repeating: "", count: n), count: n)
    }
    
    func move(_ row: Int, _ col: Int, _ player: Int) -> Int {
        let marker: String
        if player == 1 {
            marker = "X"
        } else {
            marker = "O"
        }
        
        board[row][col] = marker
        
        let outcome = checkVertical(marker, [row, col]) ||
                        checkHozitional(marker, [row, col]) ||
                        checkLeftwardDiagonal(marker, [row, col]) ||
                        checkRightwardDiagonal(marker, [row, col])
        
        if outcome {
            return player
        }
        
        return 0
    }
    
    private func checkVertical(_ marker: String, _ index: [Int]) -> Bool {
        let matches = check(marker, index, 0, [0, -1]) + check(marker, index, 0, [0, 1]) - 1 //-1 so to not double count index
        
        return matches == board.count
    }
    
    private func checkHozitional(_ marker: String, _ index: [Int]) -> Bool {
        let matches = check(marker, index, 0, [-1, 0]) + check(marker, index, 0, [1, 0]) - 1 //-1 so to not double count index
        
        return matches == board.count
    }
    
    private func checkLeftwardDiagonal(_ marker: String, _ index: [Int]) -> Bool {
        let matches = check(marker, index, 0, [-1, -1]) + check(marker, index, 0, [1, 1]) - 1 //-1 so to not double count index
        
        return matches == board.count
    }
    
    private func checkRightwardDiagonal(_ marker: String, _ index: [Int]) -> Bool {
        let matches = check(marker, index, 0, [-1, 1]) + check(marker, index, 0, [1, -1]) - 1 //-1 so to not double count index
        
        return matches == board.count
    }
    
    private func check(_ marker: String, _ index: [Int], _ count: Int, _ relativeIndex: [Int]) -> Int {
        guard index[0] >= 0, index[0] < board.count, index[1] >= 0, index[1] < board[index[0]].count else {
            return count
        }
        
        guard board[index[0]][index[1]] == marker else {
            return count
        }
        
        let newRow = index[0] + relativeIndex[0]
        let newCol = index[1] + relativeIndex[1]
        
        return check(marker, [newRow, newCol], (count + 1), relativeIndex)
    }
}

//https://leetcode.com/problems/design-tic-tac-toe/
//design
//matrix
//array
//graph theory
//DFS
//recursive
//relative indexing
//visited
//
//Solution Description:
//Treating the board as a graph we can traverse through it after each move using relative indexing to determine if a player has
//won or not. As there are four ways to win, we perform up to 4 traversals per move. We count how many index are filled with the
//players marker on each traversal by filling up a visited set with each valid move, if the count is equal to `streak` the we
//know that the player has filled in an entire row, column or diagonal and has won the game.
class TicTacToe2 {
    private let streak: Int
    private var board: [[Int]]

    init(_ n: Int) {
        streak = n
        board = Array(repeating: Array(repeating: 0, count: n), count: n)
    }
    
    func move(_ row: Int, _ col: Int, _ player: Int) -> Int {
        board[row][col] = player

        let verticalIndexing = [[-1, 0], [1, 0]]
        let horizontalIndexing = [[0, -1], [0, 1]]
        let leftToRightDiagonalIndexing = [[-1, -1], [1, 1]]
        let rightToLeftDiagonalIndexing = [[1, -1], [-1, 1]]

        let relativeIndexing = [verticalIndexing, horizontalIndexing, leftToRightDiagonalIndexing, rightToLeftDiagonalIndexing]

        for r in relativeIndexing {
            var visited = Set<[Int]>()

            dfs(row, col, player, r, &visited)

            if visited.count == streak {
                return player
            }
        }

        return 0
    }

    private func dfs(_ row: Int, _ col: Int, _ target: Int, _ relativeIndexing: [[Int]], _ visited: inout Set<[Int]>) {
        guard row >= 0, row < board.count, col >= 0, col < board[row].count else {
            return
        }

        guard board[row][col] == target else {
            return
        }

        guard !visited.contains([row, col]) else {
            return
        }

        visited.insert([row, col])

        for relativeIndex in relativeIndexing {
            dfs((row + relativeIndex[0]), (col + relativeIndex[1]), target, relativeIndexing, &visited)
        }
    }
}
