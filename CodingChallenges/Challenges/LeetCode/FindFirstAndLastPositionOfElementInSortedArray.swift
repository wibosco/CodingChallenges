//
//  FindFirstAndLastPositionOfElementInSortedArray.swift
//  CodingChallenges
//
//  Created by William Boles on 18/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/
//binary search
struct FindFirstAndLastPositionOfElementInSortedArray {
    
    //Time: O(log n)
    static func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        guard nums.count > 0 else {
            return [-1, -1]
        }
        
        var left = 0
        var right = nums.count - 1

        //find left
        while (left + 1) < right {
            let mid = left + (right - left) / 2
            
            if nums[mid] == target {
                let previous = mid - 1
                if nums[previous] == target {
                    right = previous
                } else {
                    left = mid
                }
            } else if nums[mid] > target {
                right = mid
            } else {
                left = mid
            }
        }
        
        let first: Int
        if nums[left] == target {
            first = left
        } else if nums[right] == target {
            first = right
        } else {
            first = -1
        }
        
        guard first != -1 else {
            return [-1, -1]
        }
        
        right = nums.count - 1
        
        //find right
        while (left + 1) < right {
            let mid = left + (right - left) / 2
            
            if nums[mid] == target {
                let next = mid + 1
                if nums[next] == target {
                    left = next
                } else {
                    right = mid
                }
            } else if nums[mid] > target {
                right = mid
            } else {
                left = mid
            }
        }
        
        let second: Int
        if nums[right] == target {
            second = right
        } else {
            second = left
        }
        
        return [first, second]
    }
}
