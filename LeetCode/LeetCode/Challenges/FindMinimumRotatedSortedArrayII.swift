//
//  FindMinimumRotatedSortedArrayII.swift
//  CodingChallenges
//
//  Created by William Boles on 19/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/find-minimum-in-rotated-sorted-array-ii/
//binary search
struct FindMinimumRotatedSortedArrayII {
    
    //Time: O(log n)
    //Space: O(1)
    //divide and conquer
    static func findMin(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1
        
        while left < right {
            let mid = left + (right - left) / 2
            
            if nums[mid] > nums[right] {
                left = mid + 1
            } else if nums[mid] > nums[right] {
                right = mid - 1
            } else { // equal
                right -= 1 // move right to prevent an infinite loop
            }
        }
        
        return nums[left]
    }
}
