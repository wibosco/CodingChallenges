// Created 06/11/2021.

import Foundation

//https://leetcode.com/problems/zigzag-conversion/
struct ZigzagConversion {
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(n) where n is the number of characters in `s`
    //string
    //array
    //
    //Solution Description:
    //Rather than think of this as producing one string instead think of it as producing multiple strings for each row. Ignore
    //diagonals and columns and instead think in terms of moving up and down rows. As we iterate through `s` we add each
    //character we encounter to the end of the string for that row. When we hit the final row (numRows - 1) we change direction
    //and start moving back up the rows and when we hit the first row (0) we change direction again and start moving down the
    //rows. We repeat this process until we run out of characters, at which point we concatenate the strings at each row
    //together (in row order) and return it.
    func convert(_ s: String, _ numRows: Int) -> String {
        guard numRows > 1 else {
            return s
        }

        //think of the string stored at each row as an array
        var rows = Array(repeating: [Character](), count: numRows)
        var rowIndex = 0
        var goingDown = true

        for c in s {
            rows[rowIndex].append(c) //add `c` to this rows string array

            //setting up the next row
            rowIndex += goingDown ? 1 : -1
            
            if rowIndex == 0 { //reached the top
                goingDown = true
            } else if rowIndex == numRows - 1 { //reach the bottom
                goingDown = false
            }
        }
                
        var result = [Character]()
        for r in rows {
            result += r
        }
        
        return String(result)
    }
    
    //Time: O(n + (r * c)) where n is the number of characters in `s`
    //                     where r is the number of rows
    //                     where c is the number of columns
    //Space: O(r * c)
    //string
    //simulation
    //matrix
    //modulo
    //
    //Solution Description:
    //Convert `s` into a matrix by moving up and down the rows and columns, placing each character of `s` into it's matrix
    //position. Think of the placement as having multiple cycles, each time we return to row 0 we have completed one cycle. At
    //the start of each cycle we move downwards to position characters, when we reach `numRows` we start moving diagonally
    //upwards to the right, when we reach row 0 we repeat the process. Once the matrix is populated, we then flatten it into a
    //single string by iterating through each row and appending the non-empty characters to `result`. When the matrix has been
    //fully traversed we can then return `result`.
    func convert2(_ s: String, _ numRows: Int) -> String {
        guard numRows > 1 else {
            return s
        }

        let characters = Array(s)

        let columnsInCycle = (numRows - 2)
        let fullCycle = numRows + columnsInCycle
        let columnCount = ceil(Double(characters.count) / Double(fullCycle)) * Double((columnsInCycle + 1))

        var grid: [[Character]] = Array(repeating: Array(repeating: " ", count: Int(columnCount)), count: numRows)

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

            grid[row][column] = value
        }

        var result = [Character]()

        for r in 0..<grid.count {
            for c in 0..<grid[r].count {
                guard grid[r][c] != " " else {
                    continue
                }

                result.append(grid[r][c])
            }
        }

        return String(result)
    }
}
