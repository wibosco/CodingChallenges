//
//  RemoveDuplicatesFromSortedArrayII.swift
//  LeetCode
//
//  Created by William Boles on 18/03/2022.
//

import Foundation

//https://leetcode.com/problems/remove-duplicates-from-sorted-array-ii/
//array
struct RemoveDuplicatesFromSortedArrayII {
    
    //Time: O(n) where `n` is the number of elements in `nums`
    //Space: O(1)
    //sorted
    //two pointers
    //
    //Solution Description:
    //Using two pointers (`slow` and `fast`) we iterate through `nums` and keep track of the number of duplicates
    //that we find. The `slow` pointer will keep track of the edge (on the outside) of the "valid" array (elements
    //that contain a maximum of two duplicates), the `fast` pointer keeps track of the latest element to be checked
    //for duplciation. If the `fast` pointer encounters an element that we have seen zero or only once before we
    //move that element to the "valid" side of the array. If we encounter the same element more than twice we
    //"pause" the slow pointer until we enounter a non-duplicate - the space between `slow` and `fast` can now be
    //thought of as "overridable", eventually that space will be at the end of the array and we can return `slow`
    //as the upper boundary of the "valid" array.
    //
    //Similar to: https://leetcode.com/problems/remove-duplicates-from-sorted-array/
    static func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 1 else {
            return 1
        }
        
        var duplicateCount = 1
        var slow = 1
        
        for fast in 1..<nums.count {
            if nums[fast] != nums[(fast - 1)] {
                duplicateCount = 1
            } else {
                duplicateCount += 1
            }
            
            if duplicateCount <= 2 {
                nums[slow] = nums[fast]
                slow += 1
            }
        }
        
        return slow
    }
}
