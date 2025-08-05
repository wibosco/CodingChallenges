//
//  RotateImage.swift
//  LeetCode
//
//  Created by William Boles on 11/03/2022.
//

import Foundation

//https://leetcode.com/problems/rotate-image/
struct RotateImage {
    
    //Time: O(n) where n is the elements in the matrix
    //Space: O(1)
    //matrix
    //array
    //
    //Solution Description:
    //Treating rotating the matrix as two steps:
    //
    //1. Transpose/reverse around left-to-right diagonal
    //2. Reverse each row
    //
    //In the first step we iterate through the array and swap corresponding elements around the left-to-right central diagonal.
    //It's important to note that each inner iteration we are only swapping two elements and that the central diagonal itself
    //is never swapped e.g
    //
    //[1,   2,  3,  4,  5]
    //[6,   7,  8,  9, 10]
    //[11, 12, 13, 14, 15]
    //[16, 17, 18, 19, 20]
    //[21, 22, 23, 24, 25]
    //
    //to:
    //
    //[1,  6, 11, 16, 21]
    //[2,  7, 12, 17, 22]
    //[3,  8, 13, 18, 23]
    //[4,  9, 14, 19, 24]
    //[5, 10, 15, 20, 25]
    //
    //Next, we take each row and reverse the elements:
    //
    //[21, 16, 11,  6, 1]
    //[22, 17, 12,  7, 2]
    //[23, 18, 13,  8, 3]
    //[24, 19, 14,  9, 4]
    //[25, 20, 15, 10, 5]
    func rotate(_ matrix: inout [[Int]]) {
        //transpose/reverse around left-to-right diagonal
        for i in 0..<matrix.count {
            for j in (i + 1)..<matrix.count {
                let tmp = matrix[i][j]
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = tmp
            }
        }
        
        //reverse each row
        for i in 0..<matrix.count {
            let row = matrix[i]
            matrix[i] = Array(row.reversed())
        }
    }
    
    //Time: O(n) where n is the elements in the matrix
    //Space: O(1)
    //matrix
    //array
    //math
    //
    //Solution Description:
    //When rotating a matrix by 90 degrees we are really rotating 4 cells together i.e. A moves to B, B moves to C, C moves
    //to D and D moves to A. So in order to rotate we need to group cells into 4 and rotate each cell onto the other cells
    //current location.
    func rotate2(_ matrix: inout [[Int]]) {
        var left = 0
        var right = matrix.count - 1

        while left < right {
            //i is the row and column offset too allow for grdually moving inwards
            for i in 0..<(right - left) {
                let top = left
                let bottom = right
                
                //save top left
                let tmp = matrix[top][left + i] //first cell to be overwritten
                
                //move bottom left into top left
                matrix[top][left + i] = matrix[bottom - i][left]
                
                //move bottom right into bottom left
                matrix[bottom - i][left] = matrix[bottom][right - i]
                
                //move top right bottom right
                matrix[bottom][right - i] = matrix[top + i][right]
                
                //move top left into top right
                matrix[top + i][right] = tmp
            }
            
            left += 1
            right -= 1
        }
    }
    
    //Time: O(n * m) where n is the number of rows in `mat`
    //               where m is the number of columns
    //Space: O(n * m)
    //matrix
    //array
    //
    //Solution Description:
    //When rotating a matrix 90 degrees the columns become rows and the rows because columns, with the values reversed. As
    //there are 3 possible rotations of 90 degrees we need to rotate the matrix 3 times to exhaust all possible configurations.
    //On each rotation we populate a new matrix - `mat2` to then compare against target. In order to rotate wwe iterate first
    //through each row and then the columns in that. As each column will become a row in the rotated matrix we use the index of
    //the column as the row index and insert the value as the first element of that row. After populating the new matrix we
    //compare against `target` and if they match we return true else we repeat the process.
    //
    //Similar to: https://leetcode.com/problems/determine-whether-matrix-can-be-obtained-by-rotation/
    func rotate3(_ matrix: inout [[Int]]) {
        var matrix2 = Array(repeating: [Int](), count: matrix.count)
        
        for r in 0..<matrix.count {
            for c in 0..<matrix[r].count {
                let val = matrix[r][c]
                matrix2[c].insert(val, at: 0)
            }
        }
        
        matrix = matrix2
    }
}
