//
//  SortTheMatrixDiagonally.swift
//  LeetCode
//
//  Created by William Boles on 13/04/2022.
//

import Foundation

//https://leetcode.com/problems/sort-the-matrix-diagonally/
//matrix
struct SortTheMatrixDiagonally {
    
    //Time: O(n * m * ((log (min(n, m)))) where n is the number of rows in `mat`, m is the number of columns in `mat`
    //Space: O(n * m + log (min(n, m)))) where `log min(n, m)` is the size of  one diagonal
    //sorting
    //dictionary
    //array
    //
    //Solution Description:
    //Cells that are on the same diagonal share the same value for `row + column` so we can traverse `mat` by rows
    //and store all cells with the same `row + column` in the `diagonals` dictionary. We then sort these diagonals in
    //descending order so that when we populate `orderedMat`, we pop the last item from that diagonal array - this
    //means that we don't need to keep a seperate index for each diagonal to know which item to pop or remove items
    //from the start of that array which is a O(n) operation (popping is a O(1) operation). We then retraverse `mat`
    //and extract the value at each location from `diagonals`
    static func diagonalSort(_ mat: [[Int]]) -> [[Int]] {
        var orderedMat = mat
        var diagonals = [Int: [Int]]()
        
        for row in 0..<mat.count {
            for column in 0..<mat[row].count {
                let value = mat[row][column]
                diagonals[(row - column), default: [Int]()].append(value)
            }
        }
        
        for (key, values) in diagonals {
            diagonals[key] = values.sorted { $0 > $1 }
        }
        
        for row in 0..<mat.count {
            for column in 0..<mat[row].count {
                orderedMat[row][column] = diagonals[(row - column)]!.removeLast()
            }
        }
        
        return orderedMat
    }
    
    //Time: O((n + m) * ((min(n, m) log (min(n, m)))) where n is the number of rows in `mat`, m is the number
    //      of columns in `mat`
    //Space: O(n * m + (min(n, m)))) where `min(n, m)` is the size of one diagonal
    //relative indexing
    //sorting
    //array
    //
    //Solution Description:
    //A diagonal from left to right needs to start in either the first row or the first column so first we extract all
    //possible diagonals from the first row by using relative indexing to determine the next cell in that diagonal
    //(always row + 1 and column + 1). We then sort this diagonal in ascending order and place the sorted diagonal into
    //a different matrix (`orderedMat`). We repeat this process for the first column (skipping the first row cell as
    //this has already been sorted).
    static func diagonalSortRelativeIndexing(_ mat: [[Int]]) -> [[Int]] {
        var orderedMat = mat //n * m
        
        //m * min(n, m) log min(n, m)
        
        //first column
        for column in 0..<mat[0].count { //m
            var values = [Int]()
            
            extractDiagonal(mat, 0, column, &values) //min(n, m)
            
            values.sort { $0 < $1 } //min(n, m) log min(n, m)
            
            insertDiagonal(&orderedMat, 0, column, values, 0) //min(n, m)
        }
        
        //n * min(n, m) log min(n, m)
        
        //first row
        for row in 1..<mat.count { //n
             var values = [Int]()
            
            extractDiagonal(mat, row, 0, &values)
            
            values.sort { $0 < $1 } //min(n, m) log min(n, m)
            
            insertDiagonal(&orderedMat, row, 0, values, 0)
        }
        
        return orderedMat
    }
    
    private static func extractDiagonal(_ mat: [[Int]], _ row: Int, _ column: Int, _ values: inout [Int]) {
        values.append(mat[row][column])
        
        let newRow = row + 1
        let newColumn = column + 1
        
        guard newRow < mat.count else {
            return
        }
        
        guard newColumn < mat[0].count else {
            return
        }
        
        extractDiagonal(mat, newRow, newColumn, &values)
    }
    
    private static func insertDiagonal(_ mat: inout [[Int]], _ row: Int, _ column: Int, _ values: [Int], _ index: Int) {
        mat[row][column] = values[index]
        
        let newRow = row + 1
        let newColumn = column + 1
        
        guard newRow < mat.count else {
            return
        }
        
        guard newColumn < mat[0].count else {
            return
        }
        
        insertDiagonal(&mat, newRow, newColumn, values, (index + 1))
    }
}
