//
//  MergeTwoSortedLists.swift
//  LeetCode
//
//  Created by William Boles on 10/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/merge-two-sorted-lists/
struct MergeTwoSortedLists {
    
    //Time: O(m+n) where m is the length of `l1`
    //             where n is the length of `l2`
    //Space: O(1)
    //iterative
    //sentinel head
    //linked list
    //
    //Solution Description:
    //Iteratively walk through `l1` and `l2` choosing the smaller node from each list to add to the merged list. We continue
    //until one list is exhausted and then add the remaining of the other to merged  list. To keep access to the head of the
    //merged list we employ a sentinel head node
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1
        var l2 = l2
        
        let sentinel = ListNode(0)
        var tail = sentinel

        while let l1N = l1, let l2N = l2 { //only loop until you exhaust one of the lists
            if l1N.val < l2N.val {
                tail.next = l1N
                
                l1 = l1N.next
            } else {
                tail.next = l2N
                
                l2 = l2N.next
            }
            
            tail = tail.next! //move the tail of merged
        }
        
        tail.next = (l1 == nil) ? l2 : l1 //add the remaining nodes as is to the merged list
        
        return sentinel.next
    }
    
    //Time: O(m+n) where m is the length of `l1`
    //             where n is the length of `l2`
    //Space: O(m+n) recursive call stack, where m is the length of `l1`
    //                                    where n is the length of `l2`
    //linked list
    //recursive
    //merge sort
    //sentinel head
    //
    //Solution Description:
    //Recursively walk through l1 and l2 choosing the smaller node from each list to add to the `merged` list. Continue until
    //one list is exhausted and then add the remaining of the other to `merged`
    func mergeTwoListsRecursive(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let sentinel = ListNode(0)
        
        mergeTwoLists(l1, l2, sentinel)
        
        return sentinel.next
    }
    
    private func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?, _ tail: ListNode) {
        guard let l1 = l1 else {
            tail.next = l2 //we've reached the end of l1, add all of l2 to merged as it's already sorted
            return
        }
        
        guard let l2 = l2 else {
            tail.next = l1 //we've reached the end of l2, add all of l1 to merged as it's already sorted
            return
        }
        
        if l1.val < l2.val {
            tail.next = l1
            mergeTwoLists(l1.next, l2, tail.next!)
        } else {
            tail.next = l2
            mergeTwoLists(l1, l2.next, tail.next!)
        }
    }
}
