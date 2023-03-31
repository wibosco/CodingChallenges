//
//  LinkedListCycleII.swift
//  LeetCode
//
//  Created by William Boles on 19/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/linked-list-cycle-ii/
//linked list
struct LinkedListCycleII {
    
    //Time: O(n) where `n` is the number of nodes in the list
    //Space: O(1)
    //two pointers
    //slow and fast pointers
    //
    //Solution Description:
    //Using a fast and slow pointer iterate through the list. If they meet we know that we have a cycle; if they don't meet
    //and the fast pointer reaches the end of the list then we don't have a cycle. If they do meet then we reset the slow
    //pointer back to the start of the list, this will ensure that the slow and fast pointer are both the same number of
    //nodes away from the entrance to the cycle. We then move each node by one node until they meet again, at which point we
    //can return either.
    //
    //See: https://en.wikipedia.org/wiki/Cycle_detection#Floyd's_Tortoise_and_Hare
    //Similar to: https://leetcode.com/problems/find-the-duplicate-number/
    //Similar to: https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree-iii/
    static func detectCycle(_ head: ListNode?) -> ListNode? {
        var hare: ListNode? = head
        var tortoise: ListNode? = head
        
        repeat {
            hare = hare?.next?.next
            tortoise = tortoise?.next
        } while hare != tortoise //ensures that this loop is ran at least once
        
        guard hare != nil else {
            return nil
        }
        
        tortoise = head //reset to the start of the list
        
        while hare != tortoise { //next time they meet will be at the start of the cycle
            hare = hare?.next
            tortoise = tortoise?.next
        }
        
        return hare //could be tortoise here instead
    }
    
    //Time: O(n) where `n` is the number of nodes in the list
    //Space: O(n) where `n` is the number of nodes in the list
    //set
    //
    //Solution Description:
    //Iterate through the list, inserting each unique node that we come across into the `list` set. If the set already
    //contains the node then we have a cycle and can return that node as the start; if we get to the end of the list we
    //know that the list doesn't contain a cycle and can return nil
    static func detectCycleSet(_ head: ListNode?) -> ListNode? {
        var list = Set<ListNode>()
        var node = head
        
        while let n = node {
            guard !list.contains(n) else {
                return n
            }
            
            list.insert(n)
            node = n.next
        }
        
        return nil
    }
}
