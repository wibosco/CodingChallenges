//
//  MergeTwo2DArraysBySummingValues.swift
//  LeetCode
//
//  Created by William Boles on 09/06/2024.
//

import Foundation

//https://leetcode.com/problems/merge-two-2d-arrays-by-summing-values/
struct MergeTwo2DArraysBySummingValues {
    
    //Time: O(n) where n is the larger count of `nums1` or `nums2`
    //Space: O(n + m) where n is the number of elements in `nums1`
    //                where m is the number of elements in `nums2`
    //array
    //two pointers
    //
    //Solution Description:
    //Using two pointers we iterate through both `nums1` and `nums2`, comparing the arrays found at each index. If the IDs
    //match then we sum their values, add that combined value to `merged` and increment both pointers; if the ID at `p1` is
    //smaller we add that smaller array to `merged` and only increment the `p1` pointer; if the ID at `p2` is smaller we
    //add that smaller array to `merged` and only increment the `p2` pointer. Once we `p1` or/and `p2` exceed the number of
    //elements in their arrays we attempt to add any remaining elements to `merged` and return `merged`.
    func mergeArrays(_ nums1: [[Int]], _ nums2: [[Int]]) -> [[Int]] {
        var merged = [[Int]]()
        
        var p1 = 0
        var p2 = 0
        
        while p1 < nums1.count && p2 < nums2.count {
            let val1 = nums1[p1]
            let val2 = nums2[p2]
            
            if val1[0] == val2[0] {
                let sum = val1[1] + val2[1]
                merged.append([val1[0], sum])
                
                p1 += 1
                p2 += 1
            } else if val1[0] < val2[0] {
                merged.append(val1)
                
                p1 += 1
            } else {
                merged.append(val2)
                
                p2 += 1
            }
        }
        
        merged.append(contentsOf: nums1[p1...])
        merged.append(contentsOf: nums2[p2...])
        
        return merged
    }
}
