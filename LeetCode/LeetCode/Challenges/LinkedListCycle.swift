//
//  LinkedListCycle.swift
//  LeetCode
//
//  Created by William Boles on 19/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/linked-list-cycle/
//linked list
struct LinkedListCycle {
    
    //Time: O(n) where n is the number of nodes in the list
    //Space: O(1)
    //two pointers
    //slow and fast pointers
    //
    //Solution Description:
    //Using a fast and slow pointer iterate through the list. If they meet we know that we have a cycle; if they don't meet and the
    //fast pointer reaches the end of the list then we don't have a cycle.
    //
    //See: https://en.wikipedia.org/wiki/Cycle_detection#Floyd's_Tortoise_and_Hare
    static func hasCycle(_ head: ListNode?) -> Bool {
        var hare = head
        var tortoise = head
        
        repeat {
            hare = hare?.next?.next
            tortoise = tortoise?.next
        } while hare != tortoise
        
        return hare != nil
    }
}
