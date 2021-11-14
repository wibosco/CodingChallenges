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
        var low = 0
        var high = nums.count - 1
        
        //find pivot
        while low < high {
            let mid = (high + low) / 2
            if nums[mid] > nums[high] {
                low = mid + 1
            } else {
                high = mid
            }
        }
        
        let pivot = low
        
        guard nums[pivot] != target else {
            return pivot
        }
        
        
        low = 0
        high = nums.count - 1
        //determine if which subarray target might be in and only
        //search that subarray
        if target >= nums[pivot] && target <= nums[high] {
            low = pivot
        } else {
            high = pivot
        }
        
        //binary search
        while low <= high {
            let mid = (high + low) / 2
            if target == nums[mid] {
                return mid
            } else if target > nums[mid] {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        
        return -1
    }
    
    //More complex but only one pass
    //O(log n)
    static func search(_ nums: [Int], _ target: Int) -> Int {
        var low = 0
        var high = nums.count - 1
        
        //find pivot and peform search
        while low <= high {
            let mid = (high + low) / 2
            if target == nums[mid] {
                return mid
            } else if nums[mid] > nums[high] {
                //pivot is somewhere to the right of mid i.e right is unsorted
                if target >= nums[low] && target <= nums[mid] {
                    //search left
                    high = mid - 1
                } else {
                    //search right
                    low = mid + 1
                }
            } else {
                //pivot is somewhere to the left of mid i.e left is unsorted
                if target >= nums[mid] && target <= nums[high] {
                    //search right
                    low = mid + 1
                } else {
                    //search left
                    high = mid - 1
                }
            }
        }
        
        return -1
    }
}
