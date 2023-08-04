//
//  NonDecreasingArray.swift
//  LeetCode
//
//  Created by William Boles on 14/07/2023.
//

import Foundation

//https://leetcode.com/problems/non-decreasing-array/
struct NonDecreasingArray {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //three pointers
    //
    //Solution Description:
    //Using three pointers we iterate through `nums` comparing the elements found at `center` and `right` to determine if that pair
    //is non-descending. If they are non-descending with increment the pointers and check the next pair; if they are descending we
    //need to determine which element to update `center` or `right`. We can't just assume that we can update `center` as it's
    //possible thay doing so will result in `center` now being non-descending with `left`. Instead we need to determine which of
    //`center` and `right` to update by comparing `right` against `left`. If `right` has a value that is non-descending then we can
    //update `center` with the value at `right` - we take value at `right` which is the smallest change we know we can make; if
    //`right` is descending from `left` then we update `right` to be `center` - we know that `center` will be non-descending in
    //regards to `left `as the previous iteration will have answered that. There is a special case where we are at the start of the
    //array where `left` isn't in the range yet so all we can do is update `center` with `right`. If any updates do occur we track
    //it with `changes` and if `changes` ever gets greater than 1 then we exit the while loop and return false. If `changes` stays
    //less than 2 then we return true.
    static func checkPossibility(_ nums: [Int]) -> Bool {
        var changes = 0
        var nums = nums
    
        //`center` and `right` will be used to determine non-descending vs descending state
        //`left` will be used when we find a descending state to determine which element to update
        var left = -1
        var center = 0
        var right = 1
        
        while right < nums.count && changes < 2 {
            //check for descending order detected
            if nums[center] > nums[right] {
                if center == 0 {
                    //can't check left so only one way to update `nums`
                    nums[center] = nums[right]
                } else {
                    //determine which element to update
                    if nums[right] >= nums[left] {
                        //`right` is non-descending from `left` so safe to update `center` with it
                        //
                        //We always want to take the smallest element possible to minimise chance that that change will
                        //introduce another descending problem
                        //
                        //e.g
                        //     l, c, r
                        // [1, 3, 7, 4] -> [1, 3, 4, 4]
                        nums[center] = nums[right]
                    } else {
                        //`right` is descending from `left` so update `right` with `center`
                        //e.g
                        //     l, c, r
                        // [1, 3, 7, 2] -> [1, 3, 7, 7]
                        nums[right] = nums[center]
                    }
                }
                changes += 1
            }
            
            left += 1
            center += 1
            right += 1
        }
        
        return (changes < 2)
    }
}
