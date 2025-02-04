//
//  SingleElementInASortedArray.swift
//  LeetCode
//
//  Created by William Boles on 31/07/2023.
//

import Foundation

//https://leetcode.com/problems/single-element-in-a-sorted-array/
struct SingleElementInASortedArray {
    
    //Time: O(log n) where n is number of elements in `nums`
    //Space: O(1)
    //array
    //binary search
    //sorted
    //
    //Solution Description:
    //As we have a sorted array, we can find the duplicate by using binary search. The trick here is to spot that an array
    //containing only doubles will always have an even number of elements. So using binary search to narrow down the search
    //space, we need to focus on the side of the `nums` that has an odd number of elements. So we can compare our `mid`
    //element against it's neighbors to determine if `mid` is the left or right of that pair and determine if it should be
    //on an even or odd index. If there is a mismatch between expectation and reality then we know which way to shift the
    //search. Of course is possible that `mid` falls on the non-duplicate element in which case we return it immediately.
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        var left = 0
        var right = (nums.count - 1)
        
        while left <= right {
            let mid = left + (right - left) / 2 //to avoid overflow
            let midLeft = mid - 1
            let midRight = mid + 1
        
            if midLeft >= 0 && nums[mid] == nums[midLeft] {
                //mid is the right side of the pair so check if its partner is on an even index
                if midLeft % 2 == 0 {
                    left = mid + 1
                } else {
                    right = mid
                }
            } else if midRight < nums.count && nums[mid] == nums[midRight] {
                //mid is the left side of the pair so check if it is on an even index
                if mid % 2 == 0 {
                    left = mid + 1
                } else {
                    right = mid
                }
            } else {
                return nums[mid]
            }
        }
        
        return -1 //should never get here
    }
}
