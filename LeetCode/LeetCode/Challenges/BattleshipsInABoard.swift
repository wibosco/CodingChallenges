// Created 05/05/2025.

import Foundation

//https://leetcode.com/problems/battleships-in-a-board/
struct BattleshipsInABoard {
    
    //Time: O(n * m) where n is the number of rows in `board`
    //               where m is the number of columns in `board`
    //Space: O(1)
    //graph theory
    //matrix
    //
    //Solution Description:
    //We iterate through each element in `board` and check if that element is an `X`. If it is we next determine if it any other
    //`X` elements precede it either vertically or horizontally if they don't then we know that we have found the edge top/left
    //most `X` of a ship and can increment `battleships`; if we find an `X` then we know that we are in the middle of the ship
    //and continue on search. By only counting treating a ship found when we find the top/left most `X` of the ship we avoid
    //having to having to use additional memory. Once all elements have been checked, we return `battleships`.
    func countBattleships(_ board: [[Character]]) -> Int {
        var battleships = 0
        
        for row in 0..<board.count {
            for column in 0..<board[row].count {
                guard board[row][column] == "X" else {
                    continue
                }
                
                //check if an `X` element exists above or to the left of this `X`
                guard (row == 0 || board[(row - 1)][column] != "X") &&
                        (column == 0 || board[row][(column - 1)] != "X") else {
                    continue
                }
                
                battleships += 1
            }
        }
        
        return battleships
    }
    
    //Time: O(n * m) where n is the number of rows in `board`
    //               where m is the number of columns in `board`
    //Space: O(n * m)
    //graph theory
    //matrix
    //relative indexing
    //DFS
    //recursive
    //multi-source
    //inline
    //
    //Solution Description:
    //We iterate through each element in `board` and check if that element is an `X`. If it is we use DFS and relative indexing
    //to find all connected `X` elements. Each `X` encountered is overridden with `.` so ensuring that we don't revisit that
    //index. Once no more `X` elements exist that are connected to the initial `X` element we exit the DFS and increment
    //`battleships`. We then move onto the next `board` element, ready to repeat the DFS if neccessary. Once all elements have
    //been checked we return `battleships`.
    func countBattleships2(_ board: [[Character]]) -> Int {
        var board = board
        var battleships = 0
        
        for row in 0..<board.count {
            for column in 0..<board[row].count {
                guard board[row][column] == "X" else {
                    continue
                }
                
                dfs(&board, row, column)
                battleships += 1
            }
        }
        
        return battleships
    }
    
    private func dfs(_ board: inout [[Character]], _ row: Int, _ column: Int) {
        guard row >= 0, row < board.count, column >= 0, column < board[0].count else {
            return
        }
        
        guard board[row][column] == "X" else {
            return
        }
        board[row][column] = "."
        
        dfs(&board, row - 1, column)
        dfs(&board, row + 1, column)
        dfs(&board, row, column - 1)
        dfs(&board, row, column + 1)
    }
    
    //Time: O(n * m) where n is the number of rows in `board`
    //               where m is the number of columns in `board`
    //Space: O(n * m)
    //graph theory
    //matrix
    //relative indexing
    //DFS
    //recursive
    //multi-source
    //visited
    //set
    //
    //Solution Description:
    //We iterate through each element in `board` and check if that element is an `X`. If it is we use DFS and relative indexing
    //to find all connected `X` elements. Each `X` encountered is added to `visited` to ensure that we don't revisit that index
    //Once no more `X` elements exist that are connected to the initial `X` element we exit the DFS and increment `battleships`
    //We then move onto the next `board` element, ready to repeat the DFS if neccessary. Once all elements have been checked
    //we return `battleships`.
    func countBattleships3(_ board: [[Character]]) -> Int {
        var visited = Set<[Int]>()
        var battleships = 0
        
        for row in 0..<board.count {
            for column in 0..<board[row].count {
                if !visited.contains([row, column]) && board[row][column] == "X" {
                    dfs(board, row, column, &visited)
                    battleships += 1
                }
            }
        }
        
        return battleships
    }
    
    private func dfs(_ board: [[Character]], _ row: Int, _ column: Int, _ visited: inout Set<[Int]>) {
        guard row >= 0, row < board.count, column >= 0, column < board[0].count else {
            return
        }
        
        guard !visited.contains([row, column]) else {
            return
        }
        visited.insert([row, column])
        
        guard board[row][column] == "X" else {
            return
        }
        
        dfs(board, row - 1, column, &visited)
        dfs(board, row + 1, column, &visited)
        dfs(board, row, column - 1, &visited)
        dfs(board, row, column + 1, &visited)
    }
}
