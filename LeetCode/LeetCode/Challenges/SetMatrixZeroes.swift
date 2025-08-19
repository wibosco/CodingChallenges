//
//  SetMatrixZeroes.swift
//  LeetCode
//
//  Created by William Boles on 16/03/2022.
//

import Foundation

//https://leetcode.com/problems/set-matrix-zeroes/
struct SetMatrixZeroes {
    
    //Time: O(n * m) where n is the number of rows
    //               where m is the number of columns
    //Space: O(n + m)
    //matrix
    //array
    //nested loops
    //set
    //
    //Solution Description:
    //First we iterate through the matrix and store the row and column index of any zeros that we come across. As we want to set
    //the full row or column to zero we don't store this index as one value but instead as to separate entires in `zeroRows` and
    //`zeroColumns` respectively this ensures that should a row have multiple zeros it will only be counted once. Once we have
    //found all the original zeros in `matrix` we iterate back through again and set the value of any cell to zero where that
    //cells row or column is in either `zeroRows` or `zeroColumns`.
    func setZeroes(_ matrix: inout [[Int]]) {
        var zeroRows = Set<Int>()
        var zeroColumns = Set<Int>()
        
        for r in 0..<matrix.count {
            for c in 0..<matrix[r].count {
                let val = matrix[r][c]
                
                if val == 0 {
                    zeroRows.insert(r)
                    zeroColumns.insert(c)
                }
            }
        }
        
        for r in 0..<matrix.count {
            for c in 0..<matrix[r].count {
                if zeroRows.contains(r) || zeroColumns.contains(c) {
                    matrix[r][c] = 0
                }
            }
        }
    }
    
    //Time: O(n * m) where n is the number of rows
    //               where m is the number of columns
    //Space: O(1)
    //array
    //matrix
    //nested loops
    //flag
    //
    //Solution Description:
    //To avoid using extra memory we need to use the matrix itself to store the infromation about which row or column
    //should be set to 0. We use the first row and column as flags to mark a row or column for zero-ing. As the cell [0, 0]
    //is the first row and column for both the first row and the first column, special care needs to be taken here with a
    //different flag used to indicate with that column should be zero-ed. So we iterate through the matrix from the second
    //row and column and where a 0 we mark the first and column as 0. We then iterate through the matrix again (again from
    //the second row and column) and using those flags set the cells in those rows and columns that have been marked as
    //to-be-zero-ed to zero. We then go through and update the first row if there was originally a zero in the first row
    //and update the first column if there was originally a zero in the first column.
    func setZeroes2(_ matrix: inout [[Int]]) {
        //as the first row and column share the same cell we need a different indicator to know if either the row or the
        //column should be set to one. We don't need both indicators as the cell can work for one so here we added a
        //special indicator/flag for the column
        var zeroFirstCol = false

        for r in 0..<matrix.count {
            if matrix[r][0] == 0 {
                zeroFirstCol = true
            }

            for c in 1..<matrix[r].count { //note how we start from 1
                if matrix[r][c] == 0 {
                    matrix[0][c] = 0
                    matrix[r][0] = 0
                }
            }
        }

        for r in 1..<matrix.count { //note how we start from 1
            for c in 1..<matrix[r].count { //note how we start from 1
                if matrix[r][0] == 0 || matrix[0][c] == 0 {
                    matrix[r][c] = 0
                }
            }
        }
        
        //so far we have updated the rows and column cell from `1...`, need to update the row and column 0 now
        
        if matrix[0][0] == 0 {
            for c in 0..<matrix[0].count {
                matrix[0][c] = 0
            }
        }

        if zeroFirstCol {
            for r in 0..<matrix.count {
                matrix[r][0] = 0
            }
        }
    }
}
