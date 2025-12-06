// Created 11/05/2023.

import Foundation

//https://leetcode.com/problems/surrounded-regions/
struct SurroundedRegions {
    
    //Time: O(n * m) where n is the number of rows in board
    //               where m is the number of columns in board
    //Space: O(n * m)
    //graph theory
    //DFS
    //relative indexing
    //matrix
    //recursive
    //multi-source
    //
    //Solution Description:
    //An `O` element is only "safe" if it either on the edge of the board or connected to a sequence of `O` elements that
    //eventually are on the edge of the board. So rather than checking each `O` element on the board instead we only
    //need to check those that are on the edge of the board and find all other `O` elements connected to that one. So
    //using DFS we search the first and last elements on each row (left and right edge) and when we encounter a `O`
    //element we update it to be `S` to mark it as staying an `O`. Setting the `O` element to `S` has the effect of
    //marking this index as visited. Using relative indexing we then search that elements neighbors for other `O`
    //elements. We then perform the same search for the first and last element of each column (top and bottom edge).
    //Once we've search for `O` elements from all edges we then iterate through all elements on the board and when we
    //encounter an `S` we transform it into `O`, if we encounter an `X` or `O` we set it to `X`.
    func solve(_ board: inout [[Character]]) {
        for row in 0..<board.count {
            searchIsland(&board, row, 0) //search for O in first element of each row
            searchIsland(&board, row, (board[row].count - 1)) //search for O in last element of each row
        }
        
        for column in 0..<board[0].count {
            searchIsland(&board, 0, column) //search for O in first element of each column
            searchIsland(&board, (board.count - 1), column) //search for O in last element of each column
        }
        
        for row in 0..<board.count {
            for column in 0..<board[row].count {
                if board[row][column] == "S" {
                    board[row][column] = "O"
                } else {
                    board[row][column] = "X"
                }
            }
        }
    }
    
    private func searchIsland(_ board: inout [[Character]], _ row: Int, _ column: Int) {
        guard row >= 0, row < board.count, column >= 0, column < board[row].count else {
            return
        }
        
        guard board[row][column] == "O" else {
            return
        }
        
        board[row][column] = "S" // S for Stay
        
        searchIsland(&board, row - 1, column)
        searchIsland(&board, row + 1, column)
        searchIsland(&board, row, column - 1)
        searchIsland(&board, row, column + 1)
    }
    
    //Time: O(n * m) where n is the number of rows in board
    //               where m is the number of columns in board
    //Space: O(n * m)
    //graph theory
    //DFS
    //relative indexing
    //matrix
    //recursive
    //multi-source
    //visited
    //
    //Solution Description:
    //An `O` element is only "safe" if it either on the edge of the board or connected to a sequence of `O` elements that
    //eventually are on the edge of the board. So we iterate through the board and when we encounter an `O` element we
    //perform a DFS from that element to find all connected `O` elements. If any of those `O` elements are on an edge
    //we set `flip` to false as we know this `O` island should not be flipped. Once our DFS is finished and if `flip` is
    //false we add that `O` island to `islands` set. To avoid searching the same island from multiple different starting
    //indexes we add each index we search to the `visited` set. Finally we iterate through all the elements in the board
    //and if that element exists in `island` we set it to `O` else we set it to `X`.
    func solveAlt(_ board: inout [[Character]]) {
        var islands = Set<[Int]>()
        var visited = Set<[Int]>()
        
        for row in 0..<board.count {
            for column in 0..<board[row].count {
                var flip = true
                var currentIsland = Set<[Int]>()
                
                dfs(board, row, column, &visited, &currentIsland, &flip)
                
                if !flip {
                    islands = islands.union(currentIsland)
                }
            }
        }
        
        for row in 0..<board.count {
            for column in 0..<board[row].count {
                if islands.contains([row, column]) {
                    board[row][column] = "O"
                } else {
                    board[row][column] = "X"
                }
            }
        }
    }
    
    private func dfs(_ board: [[Character]], _ row: Int, _ column: Int, _ visited: inout Set<[Int]>, _ currentIsland: inout Set<[Int]>, _ flip: inout Bool) {
        guard row >= 0, row < board.count, column >= 0, column < board[row].count else {
            return
        }
        
        let coord = [row, column]
        
        guard !visited.contains(coord) else {
            return
        }
        
        visited.insert(coord)
        
        guard board[row][column] == "O" else {
            return
        }
        
        //an `O` element is "safe" is it on the edge of the board
        if (row == 0 || row == (board.count - 1)) || (column == 0 || column == (board[row].count - 1)) {
            flip = false
        }
        
        currentIsland.insert(coord)
        
        dfs(board, row - 1, column, &visited, &currentIsland, &flip)
        dfs(board, row + 1, column, &visited, &currentIsland, &flip)
        dfs(board, row, column - 1, &visited, &currentIsland, &flip)
        dfs(board, row, column + 1, &visited, &currentIsland, &flip)
    }
}
