//
//  SearchInsertPosition.swift
//  LeetCode
//
//  Created by William Boles on 20/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/search-insert-position/
struct SearchInsertPosition {
    
    //Time: O(log n) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //binary search
    //sorted
    //
    //Solution Description:
    //Using binary search, we attempt to find `target` in `nums`. With each iteration through the loop we check if we have
    //selected the index that contains the target, if so we return that index. If not we reduce the search space by half
    //by either moving the left boundary right i.e. `nums[mid]` is smaller than the target or we move the right boundary
    //left i.e. `nums[mid]` is larger than the target. If having search `nums` we haven't found target then `left` will be
    //at the position that `target` would have been.
    static func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = (nums.count - 1)
        
        while left <= right { //`<=` so that for a mismatch `left` will always be where the target should go
            let mid = left + (right - left) / 2
            
            if nums[mid] == target {
                return mid
            } else if nums[mid] > target {
                right = mid - 1 //remove larger values from the search space
            } else {
                left = mid + 1 //remove smaller values from the search space
            }
        }
        
        return left
    }
}
