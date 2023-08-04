//
//  BinarySearchLeetCode.swift
//  LeetCode
//
//  Created by William Boles on 17/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/binary-search/
struct BinarySearch {
    
    //Time: O(log n) where n is the number of elements in `nums`
    //Space: O(1)
    //binary search
    //sorted
    //divide and conquer
    //
    //Solution Description:
    //Use binary search to find the `target` in `nums`. We do ths by selecting the mid element of `nums` and performing the
    //following checks:
    //
    //1. is it the target? - return the index
    //2. is it greater than the target - going forward only search the elements to the left of `mid`
    //3. is it less than the target - going forward only search the elements to the right of `mid`
    //
    //With this approach we are halving the search space with each iteration.
    static func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        
        while left <= right {
            let mid = left + (right - left) / 2 //to avoid overflow
            
            if nums[mid] == target {
                return mid
            } else if nums[mid] > target {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        return -1
    }
}
