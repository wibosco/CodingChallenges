//
//  ValidSudoku.swift
//  LeetCode
//
//  Created by William Boles on 17/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/valid-sudoku/
struct ValidSudoku {
    
    //Time: O(1) sudoku boards always contain the same number of squares (otherwise O(n^2))
    //Space: O(1) sudoku boards always contain the same number of squares (otherwise O(n^2))
    //array
    //matrix
    //nested loops
    //
    //Solution Description:
    //Iterate through each row and column checking that the value at grid location is unique in the row, column and box. There
    //is no need to make each check independently instead we can add an empty Character set for each row, column and box
    //position and check that O(1) time to determine if that value is unique.
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rows = Array(repeating: Set<Character>(), count: 9) //9 rows
        var columns = Array(repeating: Set<Character>(), count: 9) //9 columns
        var boxes = Array(repeating: Set<Character>(), count: 9) //9 boxes
        
        for r in 0..<9 {
            for c in 0..<9 {
                let val = board[r][c]
                
                guard val != "." else {
                    continue
                }
                
                //row
                guard !rows[r].contains(val) else { //check if value is already in row
                    return false
                }
                
                rows[r].insert(val)
                
                //column
                guard !columns[c].contains(val) else { //check if value is already in column
                    return false
                }
                
                columns[c].insert(val)
                
                //boxes
                //`r / 3` is an integer (floor) division and will cause rows e.g 0, 1, 2 (0) to grouped together
                // c / 3` is an integer (floor) division and will cause columns e.g 3, 4, 5 (1) to grouped together
                //`* 3` could happen to either the rows or columns as it can represent either the height or width
                let idx = (r / 3) + (c / 3) * 3
                guard !boxes[idx].contains(val) else { //check if value is already in box
                    return false
                }
                boxes[idx].insert(val)
            }
        }
        
        return true
    }
    
    //Time: O(n * m) where n is the number of rows in `board`
    //               where m is the number of columns in `board`
    //Space: O(max(n, m))
    //matrix
    //array
    //graph theory
    //relative indexing
    //DFS
    //recursive
    //visited
    //inout
    //
    //Solution Description:
    //Treating `board` as a graph we can use DFS with relative indexing to determine if the rows and columns are valid. And
    //then using relative indexing without DFS we can determine if each block is valid as well. As this is a sudoku board we
    //know the position of each block so can hard code those indexes.
    func isValidSudoku2(_ board: [[Character]]) -> Bool {
        for r in 0..<board.count {
            var seen = Set<Int>()
            if !isValid(board, r, 0, [0, 1], &seen) {
                return false
            }
        }

        for c in 0..<board[0].count {
            var seen = Set<Int>()
            if !isValid(board, 0, c, [1, 0], &seen) {
                return false
            }
        }

        let centers = [[1, 1], [1, 4], [1, 7],
                       [4, 1], [4, 4], [4, 7],
                       [7, 1], [7, 4], [7, 7]]
        
        // swiftlint:disable comma
        let relativeIndexing = [[-1, -1], [-1, 0], [-1, 1],
                                [0, -1],           [0, 1],
                                [1, -1],  [1, 0],  [1, 1]]
        // swiftlint:enable comma

        for center in centers {
            var seen = Set<Int>()
            if !isValidBox(board, center[0], center[1], relativeIndexing, &seen) {
                return false
            }
        }

        return true
    }

    private func isValid(_ board: [[Character]], _ row: Int, _ col: Int, _ relativeIndex: [Int], _ seen: inout Set<Int>) -> Bool {
        guard row >= 0, row < board.count, col >= 0, col < board[row].count else {
            return true
        }

        if let num = board[row][col].wholeNumberValue {
            if seen.contains(num) {
                return false
            }
            seen.insert(num)
        }

        let newRow = row + relativeIndex[0]
        let newCol = col + relativeIndex[1]

        return isValid(board, newRow, newCol, relativeIndex, &seen)
    }

    private func isValidBox(_ board: [[Character]], _ row: Int, _ col: Int, _ relativeIndexes: [[Int]], _ seen: inout Set<Int>) -> Bool {
        if let num = board[row][col].wholeNumberValue {
            seen.insert(num)
        }

        for relativeIndex in relativeIndexes {
            let newRow = row + relativeIndex[0]
            let newCol = col + relativeIndex[1]

            if let num = board[newRow][newCol].wholeNumberValue {
                if seen.contains(num) {
                    return false
                }
                seen.insert(num)
            }
        }

        return true
    }
}
