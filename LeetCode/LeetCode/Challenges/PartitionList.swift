//
//  PartitionList.swift
//  LeetCode
//
//  Created by William Boles on 18/03/2022.
//

import Foundation

//https://leetcode.com/problems/partition-list/
//linked list
struct PartitionList {
    
    //Time: O(n) where n is the number of nodes in the list
    //Space: O(1) we merely reassign the existing nodes
    //two pointers
    //
    //Solution Description:
    //Set up to lists: `list1` to store the less than `x` nodes and `list2` to store the greater than or equal to
    //`x` nodes. Iterate through the list and assign each node we encounter to either list. Once we have iterated
    //through the original list we break any cycle that may have been introduced between `list1` and `list2` by
    //assigning the tail of `list2` to point at nil. We then combine the two lists and using the dummy node for
    //`list1` return the head of `list1`
    static func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        var list1: ListNode? = ListNode(-1) //less than list
        let dummy1 = list1 //needed to hold onto the head of list1
        
        var list2: ListNode? = ListNode(-1) //greater than list
        let dummy2 = list2 //needed to hold onto the head of list2
        
        var current = head
        
        while let c = current {
            if x > c.val {
                list1?.next = c
                list1 = list1?.next
            } else {
                list2?.next = c
                list2 = list2?.next
            }
            
            current = c.next
        }
        
        list2?.next = nil //break any cycle between list1 and list2
        list1?.next = dummy2?.next
        
        return dummy1?.next
    }
}
