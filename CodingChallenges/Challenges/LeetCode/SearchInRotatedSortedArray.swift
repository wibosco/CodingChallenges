//
//  SearchInRotatedSortedArray.swift
//  CodingChallenges
//
//  Created by William Boles on 13/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/search-in-rotated-sorted-array/
//binary search
//array
struct SearchInRotatedSortedArray {
    //O(log n)
    static func searchAlt(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        
        //find pivot
        while left < right {
            let mid = (right + left) / 2
            if nums[mid] > nums[right] {
                left = mid + 1
            } else {
                right = mid
            }
        }
        
        let pivot = left
        
        guard nums[pivot] != target else {
            return pivot
        }
        
        
        left = 0
        right = nums.count - 1
        //determine if which subarray target might be in and only
        //search that subarray
        if target >= nums[pivot] && target <= nums[right] {
            left = pivot
        } else {
            right = pivot
        }
        
        //binary search
        while left <= right {
            let mid = (right + left) / 2
            if target == nums[mid] {
                return mid
            } else if target > nums[mid] {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return -1
    }
    
    //More complex but only one pass
    //O(log n)
    static func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        
        //find pivot and peform search
        while left <= right {
            let mid = (right + left) / 2
            if target == nums[mid] {
                return mid
            } else if nums[mid] > nums[right] {
                //pivot is somewhere to the right of mid i.e right is unsorted
                if target >= nums[left] && target <= nums[mid] {
                    //search left
                    right = mid - 1
                } else {
                    //search right
                    left = mid + 1
                }
            } else {
                //pivot is somewhere to the left of mid i.e left is unsorted
                if target >= nums[mid] && target <= nums[right] {
                    //search right
                    left = mid + 1
                } else {
                    //search left
                    right = mid - 1
                }
            }
        }
        
        return -1
    }
}
