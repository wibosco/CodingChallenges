//
//  RemoveElement.swift
//  LeetCode
//
//  Created by William Boles on 22/02/2022.
//

import Foundation

//https://leetcode.com/problems/remove-element/
//two pointers
struct RemoveElement {
    
    //Time: O(n) where `n` is the number of elements in `num`
    //Space: O(1)
    //inline
    //
    //Solution Description:
    //Using two pointer we gradually move all non `val` elements to the start of the array. The `fast` pointer increments
    //with each iteration of the loop whereas the `slow` pointer only increments when the current element != `val`. When
    //the current element != `val` then we replace the element at `slow` with the element at `fast` (if `slow` and `fast`
    //are the same this effectively has no effort), this ensures that no element in the range `0..<left` contains the `val`.
    //If the current element == `val` then we "park" the `slow` pointer at that element an move the `fast` in search of a
    //non `val` element to overwrite the `val` element at `nums[left]` index e.g for `[0, 1, 2, 2, 3, 0, 4, 2]` and
    //`val` = 2:
    //
    //1. [0, 1, 2, 2, 3, 0, 4, 2] <--- `fast` is not pointing at `val` so `slow` is updated to non-val `fast` value
    //2. [0, 1, 2, 2, 3, 0, 4, 2] <--- `fast` is not pointing at `val` so `slow` is updated to non-val `fast` value
    //3. [0, 1, 2, 2, 3, 0, 4, 2] <--- `slow` not incrementing as `fast` is pointing at `val`
    //4. [0, 1, 2, 2, 3, 0, 4, 2] <--- `slow` not incrementing as `fast` is pointing at `val`
    //5. [0, 1, 3, 2, 3, 0, 4, 2] <--- `fast` is not pointing at `val` so `slow` is updated to non-val `fast` value
    //6. [0, 1, 3, 0, 3, 0, 4, 2] <--- `fast` is not pointing at `val` so `slow` is updated to non-val `fast` value
    //7. [0, 1, 3, 0, 3, 0, 4, 2] <--- `fast` is not pointing at `val` so `slow` is updated to non-val `fast` value
    //8. [0, 1, 3, 0, 3, 0, 4, 2] <--- `slow` not incrementing as `fast` is pointing at `val`
    //
    //NB: It's important to stress here that we override values and don't swap them
    //
    //Similar to https://leetcode.com/problems/remove-duplicates-from-sorted-array/
    static func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var slow = 0
        var fast = 0
        
        while fast < nums.count {
            if nums[fast] != val {
                //sometimes `slow` and `fast` will be the same but its faster to just always assign than to
                //check and then assign sometimes
                nums[slow] = nums[fast]
                slow += 1
            }
    
            fast += 1
        }
        
        return slow
    }
}
