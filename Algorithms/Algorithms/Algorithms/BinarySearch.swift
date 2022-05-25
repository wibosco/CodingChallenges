//
//  BinarySearch.swift
//  Algorithms
//
//  Created by William Boles on 25/05/2022.
//

import Foundation

struct BinarySearch {
    
    //Time: O(log n) where n is the number of elements in `values`
    //Space: O(1)
    //binary search
    //array
    //sorted
    //divide and conquer
    //two pointers
    //
    //Solution Description:
    //Binary search works by selecting the middle index in the sorted array `values` and comparing its value against `target`.
    //If `values[mid]` matches `target` then we have found our target and can return; if  `values[mid]` does not match `target`
    //then we half the search space by moving either `left` to the right (if `values[mid]` was smaller than `target`) or moving
    //`right` to the left (if `values[mid]` was larger than `target`). We can reduce the search space like this because `values`
    //sorted so we know that if `values[mid]` was smaller than `target` then any index less than `mid` will contain an even
    //smaller value than `values[mid]` so searching those other indexes would be pointless (the opposite is true for reducind
    //the search space to the right of `mid`). 
    static func findIndex(of target: Int, in values: [Int]) -> Int? {
        guard values.count > 1 else {
            if values.first == target {
                return 0
            }
            
            return nil
        }
        
        var left = 0
        var right = values.count - 1
        
        while left <= right {
            let mid = left + (right - left) / 2 //to avoid overflow
            
            if values[mid] == target {
                return mid
            } else if values[mid] > target {
                //values[mid] is too large lets ensure a smaller value is choosen next time by selecting from the smaller side
                //of the possible values
                right = mid - 1
            } else {
                //values[mid] is too small lets ensure a larger value is choosen next time by selecting from the larger side
                //of the possible values
                left = mid + 1
            }
        }
        
        return nil
    }
}
