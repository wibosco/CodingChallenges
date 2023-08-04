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
    //Iterate through each row and column checking that the value at grid location is unique in the row, column and
    //box. There is no need to make each check independently instead we can add an empty Character set for each row,
    //column and box position and check that O(1) time to determine if that value is unique.
    static func isValidSudoku(_ board: [[Character]]) -> Bool {
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
}
