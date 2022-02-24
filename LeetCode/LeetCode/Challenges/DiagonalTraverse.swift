//
//  DiagonalTraverse.swift
//  CodingChallenges
//
//  Created by William Boles on 01/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/diagonal-traverse/
//matrix
struct DiagonalTraverse {
    
    //Time: O(m * n) where `m` is number of rows and `n` the number of columns
    //Space: O(1)
    //path finding
    //
    //Solution Description:
    //Walk the diagonals in the matrix, moving between row and column as neccessary.
    static func findDiagonalOrder(_ mat: [[Int]]) -> [Int] {
        let rowCount = mat.count
        let columnCount = mat[0].count
        
        var r = 0
        var c = 0
        
        var order = Array(repeating: 0, count: (rowCount * columnCount))
        
        for i in 0..<order.count {
            order[i] = mat[r][c]
            
            if (r + c).isMultiple(of: 2) { //upwards
                if c == (columnCount - 1) { //change direction
                    r += 1 // end of columns, move down onto start of downwards diagonal
                } else if r == 0 { //change direction
                    c += 1
                } else { //traverse the diagonal
                    r -= 1
                    c += 1
                }
            } else { // downloads
                if r == (rowCount - 1) { //change direction
                    c += 1 // end of rows, move right onto start of upwards diagonal
                } else if c == 0 { //change direction
                    r += 1
                } else { //traverse the diagonal
                    r += 1
                    c -= 1
                }
            }
        }
        
        return order
    }
    
    //Time: O(m * n) where `m` is number of rows and `n` the number of columns
    //Space: O(m * n) where `m` is number of rows and `n` the number of columns
    //dictionary
    //
    //Solution Description:
    //If two elements are on the same diagonal then (r1 - c1) == (r2 - c2). Using this we can iterate through the matrix
    //and sum the index at each element, that sum can then be the key to our `diagonals` dictionary which will hold
    //all diagonals for a given key as an array. Once the `diagonals` dictionary is populated we can then iterate through
    //the keys that we discovered (in order) and if the key is even reverse the order of the diagonal array and add to the
    //`order` array; if not we just add as is to the `order` array.
    static func findDiagonalOrderSum(_ mat: [[Int]]) -> [Int] {
        var diagonals = [Int: [Int]]()
        var keys = [Int]()
        
        for i in 0..<mat.count {
            for j in 0..<mat[i].count {
                let key = i + j
                let val = mat[i][j]
                
                if diagonals[key] == nil {
                    diagonals[key] = [Int]()
                    keys.append(key)
                }
                
                diagonals[key]?.append(val)
            }
        }
        
        var order = [Int]()
        for key in keys {
            if key.isMultiple(of: 2) { //upwards
                let elements = diagonals[key]!
                for i in (0..<elements.count).reversed() {
                    order.append(elements[i])
                }
            } else { //downloads
                order.append(contentsOf: diagonals[key]!)
            }
        }
            
        return order
    }

//    let upwardRelativeIndexing = [-1, 1] //[row, column]
//    let downwardRelativeIndexing = [1, -1]
//    private static func neighbor(_ mat: [[Int]], _ row: Int, _ column: Int) {
//
//    }
}