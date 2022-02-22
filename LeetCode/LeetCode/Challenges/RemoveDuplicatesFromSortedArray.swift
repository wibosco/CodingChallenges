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
struct RemoveDuplicatesFromSortedArray {
    
    //Time: O(n)
    //Space: O(1)
    //sorted
    //inline
    //
    //Solution Description:
    //Using two pointers we orderride duplicates with the next non-duplicate value. As this array is sorted we know that an
    //duplicates will come directly after a value. By using two pointers we keep the `slow` pointer on the edge of our
    //non-duplicates array while the `fast` pointers skims over any duplicates. Once a non-duplicate is found we expand our
    //non-duplicates array space by 1 and move that non-duplicate into that space. So if we start with `[1, 1, 2, 2, 3, 3]`
    //usingg this approach we will end up with `[1, 2, 3, 2, 3, 3]` with the `slow` pointer stopping at 2 so our non-duplicate
    //array is `[1, 2, 3]`. This happens by:
    //
    //1. [1, 1, 2, 2, 3, 3] <--- `slow` and `fast` pointing at same value
    //2. [1, 2, 2, 2, 3, 3] <--- `slow` and `fast` pointing at different values so `left + 1` is set to value of `fast`
    //3. [1, 2, 2, 2, 3, 3] <--- `slow` and `fast` pointing at same value
    //4. [1, 2, 3, 2, 3, 3] <--- `slow` and `fast` pointing at different values so `left + 1` is set to value of `fast`
    //5. [1, 2, 3, 2, 3, 3] <--- `slow` and `fast` pointing at same value
    //
    //(Just 5 iterations as `fast` starts at 1)
    //
    //NB: It's important to stress here that we override values and don't swap them
    static func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.count
        }
        
        var slow = 0
        var fast = 1
        
        while fast < nums.count {
            if nums[slow] != nums[fast] {
                //non-duplicate found so move it to the position after the first index
                //in the duplicate squence
                slow += 1
                //sometimes `slow` and `fast` will be the same but its faster to just always assign than to
                //check and then assign sometimes
                nums[slow] = nums[fast]
            }
            
            fast += 1
        }
        
        return slow + 1 //convert index into count by adding 1
    }
}
