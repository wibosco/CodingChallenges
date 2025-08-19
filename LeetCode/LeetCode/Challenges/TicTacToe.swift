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
//won or not. As there are 4 ways to win, we perform up to 4 traversals per move. We count how many index are filled with the
//players marker on each traversal, if the count is equal to the length of the board then we know that the player has filled in
//an entire row, column or diagonal and has won the game.
class TicTacToe {
    private let n: Int
    private var board: [[Int]]

    init(_ n: Int) {
        self.n = n
        self.board = Array(repeating: Array(repeating: 0, count: n), count: n)
    }
    
    func move(_ row: Int, _ col: Int, _ player: Int) -> Int {
        board[row][col] = player

        if hasWon(row, col, player) {
            return player
        }

        return 0
    }

    private func hasWon(_ r: Int, _ c: Int, _ player: Int) -> Bool {
        return checkRow(r, c, player) ||
                checkColumn(r, c, player) ||
                checkLeftDiagonal(r, c, player) ||
                checkRightDiagonal(r, c, player)
    }

    private func checkRow(_ r: Int, _ c: Int, _ player: Int) -> Bool {
        let matches = check(r, c, player, [0, -1]) + check(r, c, player, [0, 1]) - 1 //-1 so to not double count first index

        return matches == n
    }

    private func checkColumn(_ r: Int, _ c: Int, _ player: Int) -> Bool {
        let matches = check(r, c, player, [-1, 0]) + check(r, c, player, [1, 0]) - 1 //-1 so to not double count first index

        return matches == n
    }

    private func checkLeftDiagonal(_ r: Int, _ c: Int, _ player: Int) -> Bool {
        let matches = check(r, c, player, [-1, -1]) + check(r, c, player, [1, 1]) - 1 //-1 so to not double count first index

        return matches == n
    }

    private func checkRightDiagonal(_ r: Int, _ c: Int, _ player: Int) -> Bool {
        let matches = check(r, c, player, [-1, 1]) + check(r, c, player, [1, -1]) - 1 //-1 so to not double count first index

        return matches == n
    }

    private func check(_ r: Int, _ c: Int, _ player: Int, _ direction: [Int]) -> Int {
        guard r >= 0, r < board.count, c >= 0, c < board[r].count else {
            return 0
        }

        guard board[r][c] == player else {
            return 0
        }

        return check((r + direction[0]), (c + direction[1]), player, direction) + 1
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
