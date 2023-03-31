//
//  PeakIndexMountainArray.swift
//  LeetCode
//
//  Created by William Boles on 17/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation


//https://leetcode.com/problems/peak-index-in-a-mountain-array/
struct PeakIndexMountainArray {
    
    //Time: O(log n)
    //binary search
    static func peakIndexInMountainArray(_ arr: [Int]) -> Int {
        var left = 0
        var right = arr.count - 1
        
        while left < right {
            let mid = left + (right - left) / 2
            
            if arr[mid] > arr[mid + 1] {
                right = mid
            } else {
                left = mid + 1
            }
            
        }
        
        return left
    }
    
    //Time: O(n)
    static func peakIndexInMountainArrayLinear(_ arr: [Int]) -> Int {
        var peak: Int?
        var i = 1
        while peak == nil {
            if arr[i - 1] < arr[i] &&
                arr[i] > arr[i + 1] {
                peak = i
            }
            
            i += 1
        }
        
        return peak!
    }
}
