//
//  RemoveDuplicatesFromSortedArray.swift
//  CodingChallenges
//
//  Created by William Boles on 10/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/remove-duplicates-from-sorted-array/
//two pointers
//sorted
struct RemoveDuplicates {
    //Don't use an extra memory structure
    //Time: O(n)
    //Space: O(1)
    //
    //Solution Description:
    //Using two pointers we orderride duplicates with the next non-duplicate
    //value. This ensures that everything up to the `slow` index is in order
    //and contains no duplicates so so [1,1,2,2,3,3] becomes [1,2,3,2,3,3]
    //and slow pointer stops at index 2
    //
    //NB: The gap between the slow and fast pointer is a dead zone with values
    //that we don't care about. We only care about what comes before `slow` and
    //what comes after `fast`
    //
    //NB2: It's important to stress here that we override values and don't swap
    //them
    static func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.count
        }
        
        var slow = 1
        for fast in 1..<nums.count where nums[fast - 1] != nums[fast] {
            nums[slow] = nums[fast]
            slow += 1
        }
        
        return slow
    }
}
