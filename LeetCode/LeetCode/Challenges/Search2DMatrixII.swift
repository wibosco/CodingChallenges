//
//  Search2DMatrixII.swift
//  LeetCode
//
//  Created by William Boles on 20/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/search-a-2d-matrix-ii/
//binary search
struct Search2DMatrixII {
    
    //Time: O(n log n) `n` is the number of columns
    //Space: O(1)
    //matrix
    //sorted
    //
    //Solution Description:
    //We can use the fact that each column and row is sorted (exclusive to each other) to search for the `target` using
    //binary search on either row and column. By using binary search we are able to discard half the search space (row or
    //column) everytime we don't find the target. Below we are search columns.
    static func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        //search columns
        for i in 0..<matrix[0].count {
            var left = 0
            var right = matrix.count - 1
            
            while left <= right {
                let mid = left + (right - left) / 2
                
                if matrix[mid][i] == target { //matrix is [row][column]
                    return true
                } else if matrix[mid][i] > target {
                    right = mid  - 1
                } else {
                    left = mid + 1
                }
            }
        }
        
        return false
    }
    
    //Time: O(n log n where `n` is the number of rows
    //Space: O(1)
    //matrix
    //sorted
    //
    //Solution Description:
    //We can use the fact that each column and row is sorted (exclusive to each other) to search for the `target` using
    //binary search on either row and column. By using binary search we are able to discard half the search space (row or
    //column) everytime we don't find the target. Below we are search row.
    static func searchMatrixRows(_ matrix: [[Int]], _ target: Int) -> Bool {
        //search rows
        for row in matrix {
            var left = 0
            var right = row.count - 1
            
            while left <= right {
                let mid = left + (right - left) / 2
                
                if row[mid] == target {
                    return true
                } else if row[mid] > target {
                    right = mid  - 1
                } else {
                    left = mid + 1
                }
            }
        }
        
        return false
    }
}
