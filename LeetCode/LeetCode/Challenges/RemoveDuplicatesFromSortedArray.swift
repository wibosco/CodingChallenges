//
//  RemoveDuplicatesFromSortedArray.swift
//  LeetCode
//
//  Created by William Boles on 10/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/remove-duplicates-from-sorted-array/
struct RemoveDuplicatesFromSortedArray {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //two pointers
    //array
    //sorted
    //inline
    //
    //Solution Description:
    //Using two pointers we override duplicates with the next non-duplicate value. As this array is sorted we know that an
    //duplicates will come directly after a value. By using two pointers we keep the `slow` pointer on the edge of our
    //non-duplicates array while the `fast` pointer skims over any duplicates. Once a non-duplicate is found we move that
    //non-duplicate into the non-duplicates side of the array and move the non-duplicates boundary forward by one. So if we
    //start with `[1, 1, 2, 2, 3, 3]` using this approach we will end up with `[1, 2, 3, 2, 3, 3]` with the `slow` pointer
    //stopping at 2 so our non-duplicate array is `[1, 2, 3]`. This happens by:
    //
    //1. [1, 1, 2, 2, 3, 3] <--- `slow` and `fast` pointing at same index (index: 1)
    //                            `nums[fast] == nums[(fast - 1)]`
    //                            so increment `fast` and pause `slow`
    //2. [1, 2, 2, 2, 3, 3] <--- `slow` and `fast` pointing at different indexes (index: 1, index: 2)
    //                            `nums[fast] != nums[(fast - 1)]`
    //                            so override `slow` element with `fast` element and increment both
    //3. [1, 2, 2, 2, 3, 3] <--- `slow` and `fast` pointing at different indexes (index: 2, index: 3)
    //                            `nums[fast] == nums[(fast - 1)]`
    //                            so increment `fast` and pause `slow`
    //4. [1, 2, 3, 2, 3, 3] <--- `slow` and `fast` pointing at different indexes (index: 2, index: 4)
    //                            `nums[fast] != nums[(fast - 1)]`
    //                            so override `slow` element with `fast` element and increment both
    //5. [1, 2, 3, 2, 3, 3] <--- `slow` and `fast` pointing at different indexes (index: 3, index: 5)
    //                            `nums[fast] == nums[(fast - 1)]`
    //                            so increment `fast` and pause `slow`
    //6. Finished
    //
    //(Just 5 iterations as `fast` starts at 1)
    //
    //NB: It's important to stress here that we override values and don't swap them
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.count
        }
        
        var slow = 1
        
        for fast in  1..<nums.count {
            if nums[fast] != nums[(fast - 1)] {
                //sometimes `slow` and `fast` will be the same but its faster to just always assign than to
                //check and then assign sometimes
                nums[slow] = nums[fast]
                
                //non-duplicate found so move it to the position after the first index in the duplicate sequence
                slow += 1
            }
        }
        
        return slow
    }
    
    //Time: O(n) where n is the number of elements of in `nums`
    //Space: O(1)
    //array
    //two pointers
    //sorted
    //inline
    //
    //Solution Description:
    //Using two pointers we override duplicates with the next non-duplicate value. As this array is sorted we know that an
    //duplicates will come directly after a value. By using two pointers we keep the `p1` pointer on the edge of our
    //non-duplicates array while the `p2` pointer skims over any duplicates. Once a non-duplicate is found we move that
    //non-duplicate into the non-duplicates side of the array and move the non-duplicates boundary forward by one. We
    //repeat this process until all non-duplicate values have been moved. `p1` is then at the edge of the non-duplicate
    //elements and can be returned as the count.
    func removeDuplicates2(_ nums: inout [Int]) -> Int {
        var p1 = 0
        var p2 = 1
        
        while p2 < nums.count {
            //we don't fast forward to avoid having check that p2 is valid when overrding below
            guard nums[p1] != nums[p2] else {
                p2 += 1
                continue
            }

            nums[(p1 + 1)] = nums[p2]

            p1 += 1
            p2 += 1
        }

        return (p1 + 1)
    }
}
