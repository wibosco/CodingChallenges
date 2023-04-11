//
//  RemoveDuplicatesFromSortedList.swift
//  LeetCode
//
//  Created by William Boles on 16/03/2022.
//

import Foundation

//https://leetcode.com/problems/remove-duplicates-from-sorted-list/
//linked list
struct RemoveDuplicatesFromSortedList {
    
    //Time: O(n) `n` is the number of elements in the list
    //Space: O(1)
    //two pointers
    //
    //Solution Description:
    //Using two pointers iterate through the list looking for duplicates. `p1` is a head of `p0` so we comparing `p0`
    //with `p1` if we encounter the same `val` for two nodes we "pause" `p0` at the start of the duplicates and move
    //`p1` forward until we find a non-duplicate node. When then by-pass the duplicate nodes from `p0` to `p1` by
    //reassigning the `next` node on `p0` to point at `p1`. To protect against duplicates at the end of the list we
    //always set the `next` node on `p0` to nil
    static func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var p0 = head
        var p1 = head?.next
        
        while p1 != nil {
            if p0?.val != p1?.val {
                p0?.next = p1
                p0 = p0?.next
            }
            
            p1 = p1?.next
        }
        
        p0?.next = nil
        
        return head
    }
}
