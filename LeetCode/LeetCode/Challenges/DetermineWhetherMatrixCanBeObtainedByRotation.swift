//
//  DetermineWhetherMatrixCanBeObtainedByRotation.swift
//  LeetCode
//
//  Created by William Boles on 11/03/2022.
//

import Foundation

//https://leetcode.com/problems/determine-whether-matrix-can-be-obtained-by-rotation/
//matrix
struct DetermineWhetherMatrixCanBeObtainedByRotation {
    
    //Time: O(n * m) where n is the number of rows in `mat` and m is the number of columns (ignore outer loop - constant)
    //Space: O(n * m) where n is the number of rows in `mat` and m is the number of columns
    //array
    //
    //Solution Description:
    //When rotating a matrix 90 degrees the columns become rows and the rows because columns, with the values reversed. As
    //there are 3 possible rotations of 90 degrees we need to rotate the matrix 3 times to exhaust all possible configurations.
    //On each rotation we populate a new matrix - `mat2` to then compare against target. In order to rotate wwe iterate first
    //through each row and then the columns in that. As each column will become a row in the rotated matrix we use the index of
    //the column as the row index and insert the value as the first element of that row. After populating the new matrix we
    //compare against `target` and if they match we return true else we repeat the process.
    func findRotation(_ mat: [[Int]], _ target: [[Int]]) -> Bool {
        guard mat != target else {
            return true
        }
        
        var mat = mat
        for _ in 0..<3 {
            var mat2 = Array(repeating: [Int](), count: mat.count)
            
            for r in 0..<mat.count {
                for c in 0..<mat[r].count {
                    let val = mat[r][c]
                    mat2[c].insert(val, at: 0) //insert at start to reverse order
                }
            }
        
            if mat2 == target {
                return true
            }
            
            mat = mat2
        }
        
        return false
    }
}
