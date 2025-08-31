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
    
    //Time: O(log n) where n is the number of elements in `arr`
    //Space: O(1)
    //binary search
    //array
    //
    //Solution Description:
    //Using binary search we iterate through `arr` and move leftwards or rightwards depending on whether we are on an
    //ascending or descending slope. When `left` crosses `right` then we have found our peak at `left` and can return it.
    //
    //Similar to: https://leetcode.com/problems/find-peak-element/
    func peakIndexInMountainArray(_ arr: [Int]) -> Int {
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
    
    //Time: O(log n) where n is the number of elements in `arr`
    //Space: O(1)
    //binary search
    //array
    //
    //Solution Description:
    //Using binary search we iterate through `arr` and move leftwards or rightwards depending on whether we are on an
    //ascending or descending slope. At each index we compare the value at `mid` against its neighbors to determine if
    //that index a peak. If we find the peak we immediately return it.
    //
    //N.B. Care must be taken to ensure we don't go out of bounds.
    func peakIndexInMountainArray2(_ arr: [Int]) -> Int {
        var left = 0
        var right = arr.count - 1

        while left <= right {
            let mid = left + (right - left) / 2

            if mid == 0 {
                if arr[mid] < arr[mid + 1] {
                    return mid + 1
                } else {
                    return mid
                }
            } else if mid == arr.count - 1 {
                if arr[mid] > arr[mid - 1] {
                    return mid
                } else {
                    return mid - 1
                }
            } else if arr[(mid - 1)] < arr[mid] && arr[(mid + 1)] < arr[mid] {
                return mid //peak
            } else if arr[(mid - 1)] < arr[mid] {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }

        return -1
    }
    
    //Time: O(n) where n is the number of elements in `arr`
    //Space: O(1)
    //array
    //
    //Solution Description:
    //We traverse through `arr` comparing each element against it's neighbors - if both neighbors are less than the
    //current value then we have found our peak can can set `peak` which will cause the loop to exit and we can then
    //return `peak`.
    func peakIndexInMountainArray3(_ arr: [Int]) -> Int {
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
