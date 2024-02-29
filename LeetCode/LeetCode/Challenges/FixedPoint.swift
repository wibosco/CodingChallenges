//
//  FixedPoint.swift
//  LeetCode
//
//  Created by William Boles on 27/02/2024.
//

import Foundation

//https://leetcode.com/problems/fixed-point/
struct FixedPoint {
    
    //Time: O(log n) where n is the number of elements in `arr`
    //Space: O(1)
    //array
    //binary search find exact match
    //
    //Solution Description:
    //As we have a sorted array we can use binary search to find where `arr[i] == i`. As always with binary search we take the
    //mid index of our search range and compare it against the target - in this case the target is the index `mid` itself, this
    //means that our target will change with each iteration. If `arr[mid] == i` then we have found one possible solution so we
    //reduce the search space by moving leftwards to see if a smaller `arr[mid] == i` exists. If `arr[mid] > i` we also reduce
    //the search space by moving leftwards as it is impossible for an element of `arr[mid] == i` to exist right of `arr[mid]`.
    //If `arr[mind] < mid` then we reduce the search space by movign rightwards as it is impossible for an element of
    //`arr[mid] == i` to exist right of `arr[mid]`. Once `left > right` we return `result` which if we found a match will be
    //that index or -1 if no match was found.
    //
    //N.B. Determining if a value can exist in the right or left search space is determined with a proof by contradiction.
    func fixedPoint(_ arr: [Int]) -> Int {
        let result  = binarySearch(arr)
        
        return result
    }
    
    private func binarySearch(_ values: [Int]) -> Int {
        var left = 0
        var right = values.count - 1
        
        var result = -1
        
        while left <= right {
            let mid = left + (right - left) / 2 //to avoid overflow
            
            if values[mid] >= mid {
                right = mid - 1
                
                if values[mid] == mid {
                    result = mid
                }
            } else {
                left = mid + 1
            }
        }
        
        return result
    }
    
    //Time: O(n) where n is the number of elements in `arr`
    //Space: O(1)
    //array
    //
    //Solution Description:
    //We loop through all elements in `arr` and compare that value against it's index. If they match we return that index (as 
    //it's the smallest possible) else we contine. If we iterate through all elements in `arr` without finding a match we
    //return -1.
    func fixedPointLooping(_ arr: [Int]) -> Int {
        for (i, value) in arr.enumerated() {
            if value == i {
                return i
            }
        }
        
        return -1
    }
}
