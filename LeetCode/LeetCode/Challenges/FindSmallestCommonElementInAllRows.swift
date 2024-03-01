//
//  FindSmallestCommonElementInAllRows.swift
//  LeetCode
//
//  Created by William Boles on 01/03/2024.
//

import Foundation

//https://leetcode.com/problems/find-smallest-common-element-in-all-rows/
struct FindSmallestCommonElementInAllRows {
    
    //Time: O(n * m log n) where n is the number elements in each row
    //                     where m is the number of rows in `mat`
    //Space: O(1)
    //array
    //matrix
    //binary search
    //nested loops
    //
    //Solution Description:
    //As we have a sort matrix we take the first row and attempt to find it's elements in all the other rows using binary search. If
    //any row doesn't not contain `target` we move onto the next element in `mat[0]` then we know that `target` can't be the smallest
    //common element so we move onto the next value in `mat[0]`.
    func smallestCommonElement(_ mat: [[Int]]) -> Int {
        for target in mat[0] {
            var matching = true
            
            for values in mat[1...] {
                if !binarySearch(values, target) {
                    matching = false
                    break
                }
            }
            
            if matching {
                return target
            }
        }
        
        return -1
    }
    
    private func binarySearch(_ values: [Int], _ target: Int) -> Bool {
        var left = 0
        var right = values.count - 1
        
        while left <= right {
            let mid = left + (right - left) / 2
            
            if values[mid] == target {
                return true
            } else if values[mid] < target {
                left = mid + 1 //move rightwards
            } else {
                right = mid - 1 //move leftwards
            }
        }
        
        return false
    }
    
    //Time: O(m + n * m) where n is the number elements in each row
    //                   where m is the number of rows in `mat`
    //Space: O(m)
    //array
    //matrix
    //sets
    //
    //Solution Description:
    //First we convert all but the first row into sets. Then using the first row we iterate through each value and attempt to 
    //find it in all the sets. If we find a row-set that doesn't have `target` we know that `target` can't be common and move
    //onto the next value.
    func smallestCommonElementSets(_ mat: [[Int]]) -> Int {
        var sets = [Set<Int>]()
        
        for row in mat[1...] {
            let set = Set<Int>(row)
            sets.append(set)
        }
            
        for target in mat[0] {
            var matching = true
            
            for values in sets {
                if !values.contains(target) {
                    matching = false
                    break
                }
            }
            
            if matching {
                return target
            }
        }

        return -1
    }
    
}
