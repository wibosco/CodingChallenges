//
//  CheckIfANumberIsMajorityElementInASortedArray.swift
//  LeetCode
//
//  Created by William Boles on 01/03/2024.
//

import Foundation

//https://leetcode.com/problems/check-if-a-number-is-majority-element-in-a-sorted-array/
struct CheckIfANumberIsMajorityElementInASortedArray {
    
    //Time: O(log n) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //binary search
    //sorting
    //
    //Solution Description:
    //As `nums` is sorted we can use binary search find the first index of `target` and the last index of `target`. With
    //these indexes we can calculate if `target` is th majority element by checking if it has a range greater than half
    //the size of `nums`.
    func isMajorityElement(_ nums: [Int], _ target: Int) -> Bool {
        let leftMost = leftMostBinarySearch(nums, target)
        let rightMost = rightMostBinarySearch(nums, target)
        
        guard leftMost > -1, rightMost > -1 else {
            return false
        }
        
        let targetOccurrence = (rightMost - leftMost) + 1

        return targetOccurrence > (nums.count / 2)
    }
    
    private func leftMostBinarySearch(_ values: [Int], _ target: Int) -> Int {
        var left = 0
        var right = values.count - 1
        
        var result = -1
        
        while left <= right {
            let mid = left + (right - left) / 2 //to avoid overflow
            
            if values[mid] >= target {
                right = mid - 1
                
                if values[mid] == target {
                    result = mid
                }
            } else {
                left = mid + 1
            }
        }
        
        return result
    }
    
    private func rightMostBinarySearch(_ values: [Int], _ target: Int) -> Int {
        var left = 0
        var right = values.count - 1
        
        var result = -1
        
        while left <= right {
            let mid = left + (right - left) / 2 //to avoid overflow
                
            if values[mid] <= target {
                left = mid + 1
                
                if values[mid] == target {
                    result = mid
                }
            } else {
                right = mid - 1
            }
        }
        
        return result
    }
}
