//
//  RemoveLinkedListElements.swift
//  LeetCode
//
//  Created by William Boles on 10/04/2022.
//

import Foundation

//https://leetcode.com/problems/remove-linked-list-elements/
struct RemoveLinkedListElements {
    
    //Time: O(n) where n is the number of nodes in the list
    //Space: O(1)
    //linked list
    //sentinel head
    //
    //Solution Description:
    //Using a sentinel head node in case `head.val` == `val` we iterate through all the elements in the list and where an
    //element != `val` we add it as the `next` node of `tail`; where an element == `val` we skip it.
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        let sentinel = ListNode(-1)
        var tail: ListNode? = sentinel
        var current = head
        
        while let c = current {
            if c.val != val {
                tail?.next = c
                tail = c
            }
            
            current = c.next
        }
        
        tail?.next = nil //special care in case the last element(s) are `val` elements
        
        return sentinel.next
    }
}
