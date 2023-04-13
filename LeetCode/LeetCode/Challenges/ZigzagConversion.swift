//
//  ZigzagConversion.swift
//  LeetCode
//
//  Created by William Boles on 06/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/zigzag-conversion/
//string
struct ZigzagConversion {
    
    //Time: O(n) where n is the numbero of characters in `s`
    //Space: O(n) where n is the numbero of characters in `s`
    //array
    //
    //Solution Description:
    //Rather than think of this as producing one string instead think of it as producing multiple strings for each row. Ignore
    //diagonals and columns and instead thinking in terms of moving up and down rows. As we iterate through `s` we add each
    //character we enounter to the end of the string that is at row. When we hit the final row (numRows - 1) we change
    //direction and start moving back up the rows and when we hit the first row (0) we change direction again and start moving
    //back down the rows. We repeat this process until we run out of characters, at which point we concatenate the strings at
    //each row together (in row order) and return it
    static func convert(_ s: String, _ numRows: Int) -> String {
        guard numRows > 1 else {
            return s
        }

        //think of the string stored at each row as an array
        var rows = Array(repeating: "", count: numRows)
        var rowIndex = 0
        var goingDown = true

        for c in s {
            rows[rowIndex] += String(c) //add `c` to this rows string array

            //setting up the next row
            rowIndex += goingDown ? 1 : -1
            
            if rowIndex == 0 { //reached the top
                goingDown = true
            } else if rowIndex == numRows - 1 { //reach the bottom
                goingDown = false
            }
        }

        return rows.joined()
    }
    
    //Time: O(3n)
    static func convertSlow(_ s: String, _ numRows: Int) -> String {
        guard numRows > 1 else {
            return s
        }

        let characters = Array(s)

        let columnsInCycle = (numRows - 2)
        let fullCycle = numRows + columnsInCycle
        let columnCount = ceil(Double(characters.count) / Double(fullCycle)) * Double((columnsInCycle + 1))

        var table = Array(repeating: Array(repeating: Character("#"), count: Int(columnCount)), count: numRows)

        var column = -1
        for index in 0..<characters.count {
            let value = characters[index]

            var row = index % fullCycle
            if row == 0 {
                column += 1
            } else if row >= numRows {
                row = (numRows - 1) - (row % (numRows - 1))
                column += 1
            }

            table[row][column] = value
        }

        let flattened = table.reduce([], +).filter { $0 != "#" }

        return String(flattened)
    }
}
