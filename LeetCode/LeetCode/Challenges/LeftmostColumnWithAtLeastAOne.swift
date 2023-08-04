//
//  LeftmostColumnWithAtLeastAOne.swift
//  LeetCode
//
//  Created by William Boles on 15/04/2022.
//

import Foundation

//https://leetcode.com/problems/leftmost-column-with-at-least-a-one/
struct LeftmostColumnWithAtLeastAOne {
    
    //Time: O(n log m) where n is the number of rows in `binaryMatrix`, m is the number of columns i n `binaryMatrix`
    //Space: O(1)
    //matrix
    //binary search
    //
    //Solution Description:
    //Using the dimensions of the binary matrix, we iterate through each row and perform a binary search on that rows
    //sorted values to determine in which column the first `1` appears. We track the lowest column that contains a `1`
    //and for each additional row we search we compare that rows lowest column with the matrixs overall lowest column.
    //If that rows lowest column value is lower than the current matrix we replace it. If no row contains a column with
    //a `1` then `leftMostColumn` is never updated and we return `-1`.
    static func leftMostColumnWithOne(_ binaryMatrix: BinaryMatrix) -> Int {
        let dimensions = binaryMatrix.dimensions()
        let rows = dimensions[0]
        let columns = dimensions[1]
        
        var leftMostColumn = Int.max
        
        for row in 0..<rows {
            let leftColumnForRow = binarySearch(binaryMatrix, row, columns)
            
            leftMostColumn = min(leftMostColumn, leftColumnForRow)
        }
        
        return leftMostColumn == Int.max ? -1 : leftMostColumn
    }
    
    private static func binarySearch(_ binaryMatrix: BinaryMatrix, _ row: Int, _ rowLength: Int) -> Int {
        var left = 0
        var right = rowLength - 1
        
        while left < right {
            let mid = left + (right - left) / 2
            
            if binaryMatrix.get(row, mid) == 0 {
                left = mid + 1
            } else {
                right = mid
            }
        }
        
        return binaryMatrix.get(row, right) == 1 ? right : Int.max
    }
}
