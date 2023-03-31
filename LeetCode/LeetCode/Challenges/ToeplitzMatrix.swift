//
//  ToeplitzMatrix.swift
//  LeetCode
//
//  Created by William Boles on 24/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/toeplitz-matrix/
//graph theory
struct ToeplitzMatrix {
    
    //Time: O(m * n) where `m` is the number of rows and `n` is the number of columns
    //Space: O(1)
    //relative indexing
    //matrix
    //iterative
    //
    //Solution Description:
    //Using relative indexing we can compare the current matrix location [r, c] against it's top-left neighbor [r - 1,  c - 1],
    //if these don't have the same value then we don't have a toeplitz matrix. As the first row and column don't a top-left
    //neighbour we skip these. Finally if we have checked all values in the martix then it means that we do have a toeplitz
    //matrix and we can return true
    //
    //N.B. this solution would also work testing bottom-right neighbor, we would just need to skip the last row and column
    //instead
    static func isToeplitzMatrix(_ matrix: [[Int]]) -> Bool {
        for i in 1..<matrix.count { // start from 1 as row 0 and column 0 can't have top-left neighbors
            for j in 1..<matrix[i].count {
                let val = matrix[i][j]
                let neighbor = matrix[(i - 1)][(j - 1)]
            
                if val != neighbor {
                    return false
                }
            }
        }
        
        return true
    }
    
    //Time: O(m * n) where `m` is the number of rows and `n` is the number of columns
    //Space: O(m + n)
    //matrix
    //dictionary
    //
    //Solution Description:
    //If two elements are on the same diagonal then (r1 - c1) == (r2 - c2) we can use this to store the value for [r1, c1] and
    //compare against the value for [r2, c2] if they don't match then we know that don't have a toeplitz matrix, if they do
    //match then we check the next value, etc. Finally if we have checked all values in the martix then it means that we do have
    //a toeplitz matrix and we can return true
    static func isToeplitzMatrixGrouping(_ matrix: [[Int]]) -> Bool {
        var groups = [Int: Int]()
        
        for i in 0..<matrix.count {
            for j in 0..<matrix[i].count {
                let currVal = matrix[i][j]
               
                if let prevVal = groups[(i - j)]  {
                    if prevVal != currVal {
                        return false
                    }
                } else {
                    groups[(i - j)] = currVal
                }
            }
        }
        
        return true
    }
}
