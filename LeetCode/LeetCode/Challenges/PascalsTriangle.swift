// Created 07/07/2023.

import Foundation

//https://leetcode.com/problems/pascals-triangle/
struct PascalsTriangle {
    
    //Time: O(n^2) where n is `numRows`
    //Space: O(n^2)
    //array
    //two pointers
    //
    //Solution Description:
    //Once we have our first row we can build all subsequent rows by taking the previous row, iterating through it left to right
    //and summing each set of neighbors that we come across and adding that to the current rows array. As we know that for each
    //row the element at start and end index has a value of `1` when building the current row we can add those in without having
    //to use the previous row.
    func generate(_ numRows: Int) -> [[Int]] {
        guard numRows > 1 else {
            return [[1]]
        }
        
        var rows = [[1]]
        
        for i in 1..<numRows {
            let previousRow = rows[(i - 1)]
            var currentRow = [Int]()
            
            //bookend current row
            currentRow.append(1)
            
            for j in 1..<previousRow.count { //note that we start at 1
                let val = previousRow[(j - 1)] + previousRow[j]
                currentRow.append(val)
            }
    
            //bookend current row
            currentRow.append(1)
            
            rows.append(currentRow)
        }
        
        return rows
    }
}
