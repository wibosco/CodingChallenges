//
//  MergeTwoSortedLists.swift
//  CodingChallenges
//
//  Created by William Boles on 10/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/merge-two-sorted-lists/
//linked list
struct MergeTwoSortedLists {
    
    //Time: O(m+n) where `m` is the length of l1 and `n` is the length of l2
    //Space: O(m+n) recursive call stack, where `m` is the length of l1 and `n` is the length of l2
    //sorting
    //recursive
    //merge sort
    //
    //Solution Description:
    //Recursively walk through l1 and l2 choosing the smaller node from each list to add to the `merged` list. Continue until one list is exhausted
    //and then add the remaining of the other to `merged`
    static func mergeTwoListsRecursive(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard l1 != nil else {
            return l2
        }
        
        guard l2 != nil else {
            return l1
        }
        
        let mergedList = ListNode(0)
        
        mergeTwoLists(l1, l2, mergedList)
        
        return mergedList.next
    }
    
    private static func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?, _ merged: ListNode) {
        guard let l1 = l1 else {
            merged.next = l2 //we've reached the end of l1, add all of l2 to merged as it's already sorted
            return
        }
        
        guard let l2 = l2 else {
            merged.next = l1 //we've reached the end of l2, add all of l1 to merged as it's already sorted
            return
        }
        
        if l1.val < l2.val {
            merged.next = l1
            mergeTwoLists(l1.next, l2, merged.next!)
        } else {
            merged.next = l2
            mergeTwoLists(l1, l2.next, merged.next!)
        }
    }
    
    //Time: O(m+n) where `m` is the length of l1 and `n` is the length of l2
    //Space: O(1) we reuse the nodes of both lists.
    //sorting
    //iterative
    //
    //Solution Description:
    //Iteratively walk through l1 and l2 choosing the smaller node from each list to add to the `merged` list. Continue until one list is exhausted
    //and then add the remaining of the other to `merged`
    static func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard l1 != nil else {
            return l2
        }
        
        guard l2 != nil else {
            return l1
        }
        
        var l1 = l1
        var l2 = l2
        
        let dummy = ListNode(0)
        var merged = dummy

        while let l1N = l1, let l2N = l2 { // only loop until you exhaust one of the lists
            if l1N.val < l2N.val {
                merged.next = l1N
                
                l1 = l1N.next
            } else {
                merged.next = l2N
                
                l2 = l2N.next
            }
            
            merged = merged.next! //move the tail of merged
        }
        
        merged.next = (l1 == nil) ? l2 : l1
        
        return dummy.next
    }
}
