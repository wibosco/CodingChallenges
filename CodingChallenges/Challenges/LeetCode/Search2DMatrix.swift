//
//  Search2DMatrix.swift
//  CodingChallenges
//
//  Created by William Boles on 20/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/search-a-2d-matrix/
//binary search
struct Search2DMatrix {
    
    //Time: O(log c + log n) where `c` is the number of rows in `matrix` and `n` the number of elements in a row
    //Space: O(1)
    //matrix
    //
    //Solution Description:
    //As the matrix is sorted we can use binary search to first determine which row we should be searching in and then
    //binary search to search that row for the target.
    static func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        var columnLeft = 0
        var columnRight = matrix.count - 1
        
        while columnLeft <= columnRight {
            let mid = columnLeft + (columnRight - columnLeft) / 2
            
            if matrix[mid][0] == target {
                return true
            } else if matrix[mid][0] > target {
                columnRight = mid - 1
            } else {
                columnLeft = mid + 1
            }
        }
        
        guard columnRight >= 0 else {
            return false
        }
        
        let searchRow = matrix[columnRight]
        
        var rowLeft = 0
        var rowRight = searchRow.count - 1
        
        while rowLeft <= rowRight {
            let mid = rowLeft + (rowRight - rowLeft) / 2
            
            if searchRow[mid] == target {
                return true
            } else if searchRow[mid] > target {
                rowRight = mid - 1
            } else {
                rowLeft = mid + 1
            }
        }
        
        return false
    }
    
    //Time: O(n) where `n` is the number of elements in `matrix`
    //Space: O(n) where `n` is the number of elements in `matrix`
    //matrix
    //
    //Solution Description:
    //As the matrix is sorted we can merge the rows into a single array and perform a binary search on single array.
    static func searchMatrixMerge(_ matrix: [[Int]], _ target: Int) -> Bool {
        var array = [Int]()
        for row in matrix {
            array.append(contentsOf: row)
        }
        
        var left = 0
        var right = array.count - 1
        
        while left <= right {
            let mid = left + (right - left) / 2
            
            if array[mid] == target {
                return true
            } else if array[mid] > target {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        return false
    }
}
