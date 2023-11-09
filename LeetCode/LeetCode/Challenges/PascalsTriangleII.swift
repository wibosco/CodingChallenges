//
//  PascalsTriangleII.swift
//  LeetCode
//
//  Created by William Boles on 20/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/pascals-triangle-ii/
struct PascalsTriangleII {
    
    //Time: O(n^2) where n is the row index
    //Space: O(l) where `l` is the number of items at row index
    //graph theory
    //iterative
    //in-line
    //
    //Solution Description:
    //Starting from 0 iteratively build up the triangle until we reach the target index - `rowIndex`. At each step we append 1 to
    //the previous row to calculate the next by going through the previous rows indexes in reverse and adding neighbors together
    //the the current rows values
    static func getRow(_ rowIndex: Int) -> [Int] {
        guard rowIndex != 0 else {
            return [1]
        }
        
        guard rowIndex != 1 else {
            return [1, 1]
        }
        
        var row = [1, 1]
        
        for i in 2...rowIndex {
            row.append(1)
            for j in (1..<i).reversed() {
                row[j] = row[(j - 1)] + row[j]
            }
        }
        
        return row
    }
    
    //Time: O(n^2) where n is the row index
    //Space: O(l) where `l` is the number of items at row index
    //graph theory
    //recursive
    //memoization
    //
    //Solution Description:
    //Starting from 0 recursively build up the triangle until we reach the target index - `rowIndex`. At each step we use the
    //previous row to calculate the next (note, we only hold onto that previous row and no other)
    static func getRowRecursive(_ rowIndex: Int) -> [Int] {
        return getRow(0, rowIndex, [])
    }
    
    private static func getRow(_ rowIndex: Int, _ targetIndex: Int, _ previousRow: [Int]) -> [Int] {
        guard rowIndex <= targetIndex else {
            return previousRow
        }
        
        let count = (previousRow.count + 1)
        var row = Array(repeating: 1, count: count)
            
        guard rowIndex != 0, rowIndex != 1 else {
            return getRow((rowIndex + 1), targetIndex, row)
        }
        
        for i in 1..<(row.count - 1) {
            let leftParent = previousRow[(i - 1)]
            let rightParent = previousRow[(i)]
            
            row[i] = leftParent + rightParent
        }
            
        return getRow((rowIndex + 1), targetIndex, row)
    }
}
