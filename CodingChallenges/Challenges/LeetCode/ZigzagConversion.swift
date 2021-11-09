//
//  ZigzagConversion.swift
//  CodingChallenges
//
//  Created by William Boles on 06/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/zigzag-conversion/
struct ZigzagConversion {
    
    //O(n)
    static func convert(_ s: String, _ numRows: Int) -> String {
        guard numRows > 1 else {
            return s
        }

        var result = Array(repeating: "", count: numRows)
        var row = 0
        var isGoingDown = true

        for c in s {
            result[row] += String(c) // think of the string stored at this index as an array

            row += isGoingDown ? 1 : -1
            if row == 0 || row == numRows - 1 {
                isGoingDown.toggle()
            }
        }

        return result.joined()
    }
    
    //O(3n)
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
