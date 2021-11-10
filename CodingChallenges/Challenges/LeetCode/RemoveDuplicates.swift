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
struct RemoveDuplicates {
    //Don't use an extra memory structure
    //0(n)
    static func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.count
        }
        
        var slow = 1
        for fast in 1..<nums.count where nums[fast - 1] != nums[fast] {
            // We avoid removing an element as this is an O(n) action
            // which would make solution O(n^2), instead as we don't
            // care about anything after `slow` we treating it as a
            // dumpingg ground so [1,1,2,2,3,3] becomes [1,2,3,2,3,3]
            nums[slow] = nums[fast]
            print(nums)
            slow += 1
        }
        
        return slow
    }
}


//while i < (nums.count - duplicateOffset) {
//    var j = (i + 1)
//    while j < (nums.count - duplicateOffset) {
//        if nums[i] == nums[j] {
//            let duplicate = nums.remove(at: j)
//            nums.append(duplicate)
//            duplicateOffset += 1
//            j -= 1
//        }
//        j += 1
//    }
//    i += 1
//}
