//
//  SetMatrixZeroes.swift
//  LeetCode
//
//  Created by William Boles on 16/03/2022.
//

import Foundation

//https://leetcode.com/problems/set-matrix-zeroes/
//matrix
struct SetMatrixZeroes {
    
    //Time: O(n * m) `n` is the number of rows and `m` is the number of columns
    //Space: O(k) where `k` is the number of zero indexes
    //array
    //nested loops
    //
    //Solution Description:
    //First we iterate through the matrix and store the row and column index of any zeros that we come across. As we want
    //to set the full row or column to zero we don't store this index as one value but instead as to separate entires in
    //`zeroRows` and `zeroColumns` respectively this ensures that should a row have mulitple zeros it will only be counted
    //once. Once we have found all the original zeros in `matrix` we iterate back through again and set the value of any
    //cell to zero where thet cells row or column is in either `zeroRows` or `zeroColumns`.
    static func setZeroes(_ matrix: inout [[Int]]) {
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
}
