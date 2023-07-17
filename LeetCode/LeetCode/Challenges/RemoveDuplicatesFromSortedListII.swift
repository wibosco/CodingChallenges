//
//  RemoveDuplicatesFromSortedListII.swift
//  LeetCode
//
//  Created by William Boles on 19/03/2022.
//

import Foundation

//https://leetcode.com/problems/remove-duplicates-from-sorted-list-ii/
//linked list
struct RemoveDuplicatesFromSortedListII {
    
    //Time: O(n) where n is the number of nodes in the list
    //Space: O(1)
    //two pointers
    //sentinel head
    //
    //Solution Description:
    //Using two pointers we iterate through the list comparing the `current` node with its next node. If their values don't
    //match then we know `current` isn't a duplicate and we move `previous` onto `current` and `current` onto `current.next`;
    //if they do match then we know we have at least two duplicates and using a nested loop we iterate through the list
    //until we reach the end of the duplicates and update `current` to beyond the duplicates. We repeat this process until
    //we reach the end of the list. At the end we set the `next` property on the tail node (`previous`) to nil to avoid the
    //scenario where there are duplicates at the end of the list.
    static func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        guard head?.next != nil else {
            return head
        }
        
        let sentinel = ListNode(-101)
        sentinel.next = head
        
        var current = head
        var previous: ListNode? = sentinel

        while current != nil {
            if current?.val != current?.next?.val {
                previous?.next = current
                previous = current
            } else {
                while current?.val == current?.next?.val { //loop past duplicates
                    current = current?.next
                }
                //It's important to note that after looping `current` will point at the last duplicate
            }
            
            current = current?.next
        }
        
        previous?.next = nil //detach duplicates at the end of the list (if there are any)
        
        return sentinel.next
    }
}
