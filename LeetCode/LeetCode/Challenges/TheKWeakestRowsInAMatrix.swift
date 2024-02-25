//
//  TheKWeakestRowsInAMatrix.swift
//  LeetCode
//
//  Created by William Boles on 25/02/2024.
//

import Foundation

//https://leetcode.com/problems/the-k-weakest-rows-in-a-matrix/
struct TheKWeakestRowsInAMatrix {
    
    //Time: O(n log m) where n is the number of rows in `mat`
    //                 where m is the number of columns in `mat`
    //Space: O(n)
    //array
    //matrix
    //binary search
    //sorting
    //
    //Solution Description:
    //Using binary we calculate the number of solider in each row and use that as the score for that row. We then sort the scores
    //in ascending order and return the first `k` elements.
    func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
        var scores = [(Int, Int)]() //[row, score]
        for i in 0..<mat.count {
            let row = mat[i]
            let score = binarySearch(row)
            scores.append((i, score))
        }
        
        scores.sort { $0.1 < $1.1 }
        
        let rows = scores.map { $0.0 }
        
        return Array(rows[0..<k])
    }
    
    //1 = solider, 0 = civilian
    private func binarySearch(_ values: [Int]) -> Int {
        let target = 1
        
        var left = 0
        var right = values.count - 1
        
        var result = -1
        
        while left <= right {
            let mid = left + (right - left) / 2 //to avoid overflow
            
            if values[mid] >= target {
                left = mid + 1
                
                if values[mid] == target {
                    result = mid
                }
            } else {
                right = mid - 1
            }
        }
        
        return result + 1 //return the number of solider in values
    }
}
