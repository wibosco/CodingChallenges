//
//  ValidSudoku.swift
//  CodingChallenges
//
//  Created by William Boles on 17/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/valid-sudoku/
//array
struct ValidSudoku {
    
    //Time: O(1) sudoku boards always contain the same number of squares
    //Space: O(1) sudoku boards always contain the same number of squares
    //
    //Solution Description:
    //Iterate through each row and column checking that the value at grid location si unique in the row, column and
    //box. There is no need to make each check independently instead we can add an empty Character set for each
    //row, column and box position and check that O(1) time to determine if that value is unique.
    static func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rows = Array(repeating: Set<Character>(), count: 9)
        var cols = Array(repeating: Set<Character>(), count: 9)
        var boxes = Array(repeating: Set<Character>(), count: 9)
        
        for r in 0..<9 {
            for c in 0..<9 {
                let val = board[r][c]
                
                guard val != "." else {
                    continue
                }
                
                //row
                guard !rows[r].contains(val) else {
                    return false
                }
                
                rows[r].insert(val)
                
                //column
                guard !cols[c].contains(val) else {
                    return false
                }
                
                cols[c].insert(val)
                
                //boxes
                let idx = (r / 3) * 3 + (c / 3)
                guard !boxes[idx].contains(val) else {
                    return false
                }
                boxes[idx].insert(val)
            }
        }
        
        return true
    }
}
