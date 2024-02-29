//
//  FindFirstAndLastPositionOfElementInSortedArray.swift
//  LeetCode
//
//  Created by William Boles on 18/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/
struct FindFirstAndLastPositionOfElementInSortedArray {
    
    //Time: O(log n)
    //Space: O(1)
    //array
    //binary search find leftmost
    //binary search find rightmost
    //
    //Solution Description:
    //Using `nums` twice with binary search, we first attempt to locate the starting index of `target`. If we can't find
    //`target` we abort and return [-1, -1]; if we do find `target` we need to make sure that we have the starting
    //(left-most) index containing `nums` so we check if `mid - 1` == `target`. If it does then we know that `mid` isn't
    //the starting index and we bring in the `right` boundary to `mid - 1` and search again; if it doesn't then we have
    //the starting index of target and can stop searching and move onto find the ending (right most) index. As it's
    //possible for there to only be one index containing `target` we initially set `endingIndex` to be `startingIndex`
    //and constrain the search space to only include elements from `startingIndex`. Searching for the ending index is
    //almost the same as search for the starting index expect when we find an index matching the `target` we inspect the
    //element to right. Once we have complete our searches we return an array containing `startingIndex` and
    //`endingIndex`
    //
    //NB: Don't be tempted on finding an element that equals `target` to then perform a linear search for the start and
    //end indexes as this potentially could involve search the whole of `nums` and turn our `log n` solution into a `n`
    //solution
    static func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        guard !nums.isEmpty else {
            return [-1, -1]
        }
        
        guard nums.count > 1 else {
            if nums[0] == target {
                return [0, 0]
            }
            return [-1, -1]
        }
        
        var left = 0
        var right = nums.count - 1

        //find startingIndex
        var startingIndex = -1
        
        while left <= right {
            let mid = left + (right - left) / 2
            
            if nums[mid] == target {
                let previous = mid - 1
                if previous >= 0 && nums[previous] == target {
                    right = previous
                } else {
                    startingIndex = mid
                    break
                }
            } else if nums[mid] > target {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        guard startingIndex != -1 else {
            return [-1, -1]
        }
        
        left = (startingIndex + 1)
        right = nums.count - 1
        
        //find endingIndex
        var endingIndex = startingIndex
        
        while left <= right {
            let mid = left + (right - left) / 2
            
            if nums[mid] == target {
                let next = mid + 1
                if next < nums.count && nums[next] == target {
                    left = next
                } else {
                    endingIndex = mid
                    break
                }
            } else if nums[mid] > target {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
    
        return [startingIndex, endingIndex]
    }
}
