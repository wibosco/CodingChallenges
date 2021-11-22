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
    
    //Time: O(n)
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
        var tail = dummy

        while let l1N = l1, let l2N = l2 { // only loop until you exhaust one of the lists
            if l1N.val < l2N.val {
                tail.next = l1N
                tail = l1N
                
                l1 = l1N.next
            } else {
                tail.next = l2N
                tail = l2N
                
                l2 = l2N.next
            }
        }
        
        tail.next = (l1 == nil) ? l2 : l1
        
        return dummy.next
    }
}
