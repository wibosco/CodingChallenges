//
//  SearchInRotatedSortedArrayII.swift
//  LeetCode
//
//  Created by William Boles on 21/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/search-in-rotated-sorted-array-ii/
//binary search
struct SearchInRotatedSortedArrayII {
    
    //Average Time: O(log n) where n is the number of elements in `nums`
    //Worse Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //
    //Solution Description:
    //In a sorted array, index 0 contains a smaller value than index n. We can use this property to know where to search in this
    //array using binary search by treating it as effectively two sorted arrays - 0..<pivot and pivot..n. Like a standard
    //binary search we take the mid point of our search space and use it to see if we have found the target. If so we can return
    //true and exit; if not then we first compare if the subarray before `mid` is sorted in ascending order i.e. left is smaller
    //than mid. If so we can safely check if `target` is within that range and move the left or right boundary appropriately. If
    //left is not less than mid we check if it is greater than mid (remember this array can contain duplicates). If so then we
    //know that the right subarray is sorted and we check if `target` would be in that subarray and move the left and right
    //boundary appropriately. Finally as this array can contain duplicates if `left` and `mid` are equal we increment left to
    //create a slightly smaller search space next iteration. 
    static func search(_ nums: [Int], _ target: Int) -> Bool {
        guard nums.count > 0 else {
            return false
        }
        
        var left = 0
        var right = nums.count - 1
        
        while left < right {
            let mid = left + (right - left) / 2
            
            if nums[mid] == target {
                return true
            } else if nums[left] < nums[mid] {
                //left subarray is sorted
                if target >= nums[left] && target <= nums[mid] {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            } else if nums[left] > nums[mid] {
                //right subarray is sorted
                if target >= nums[mid] && target <= nums[right] {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            } else {
                //left and mid are equal
                left += 1
            }
        }
        
        return nums[left] == target
    }
}
