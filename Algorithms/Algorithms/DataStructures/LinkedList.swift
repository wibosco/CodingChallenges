//
//  LinkedList.swift
//  Algorithms
//
//  Created by William Boles on 04/08/2023.
//

import Foundation

final class LinkedList<Element: Comparable> {
    
    // MARK: - Reverse
    
    //Time: O(n) where n is the number of nodes in the list.
    //Space: O(1)
    //two pointers
    //
    //Solution Description:
    //Using two pointers we iterate through the list and update the `cur` node's next pointer to point to the previous
    //node (or nil if the current node is the head of the list), we then update the `cur` to be the "old" next node `tmp`
    //and repeat the process until all nodes have been visited and updated. `prev` is now the head of the reversed list.
    //The reversal happens like:
    //
    //[1 -> 2 -> 3 -> 4 -> 5]
    //[2 -> 3 -> 4 -> 5] [1]
    //[3 -> 4 -> 5] [2 -> 1]
    //[4 -> 5] [3 -> 2 -> 1]
    //[5] [4 -> 3 -> 2 -> 1]
    //[5 -> 4 -> 3 -> 2 -> 1]
    //
    //As you can see as we swap nodes, we are effectively move them from one list to another
    static func reverse(_ head: ListNode<Element>?) -> ListNode<Element>? {
        var prev: ListNode<Element>?
        var current = head
        
        while let c = current {
            let tmpNext = c.next
            
            c.next = prev
            prev = c
            
            current = tmpNext
        }
        
        return prev
    }
    
    // MARK: - DetectCycle
    
    //Time: O(n) where n is the number of nodes in the list
    //Space: O(1)
    //linked list
    //two pointers
    //slow and fast pointers
    //
    //Solution Description:
    //Using a fast and slow pointer iterate through the list. If they meet we know that we have a cycle; if they don't meet and the
    //fast pointer reaches the end of the list then we don't have a cycle.
    //
    //See: https://en.wikipedia.org/wiki/Cycle_detection#Floyd's_Tortoise_and_Hare
    static func hasCycle(_ head: ListNode<Element>?) -> Bool {
        var slow = head
        var fast = head
        
        repeat {
            fast = fast?.next?.next
            slow = slow?.next
        } while fast != slow //if both are nil then this will end the loop
        
        return fast != nil //could have been slow
    }
    
    // MARK: - Middle
    
    //Time: O(
    //Space: O(
    //
    //Solution Description:
    //
    static func middleNode(_ head: ListNode<Element>?) -> ListNode<Element>? {
        var fast = head
        var slow = head
        
        repeat {
            slow = slow?.next
            fast = fast?.next?.next
        } while fast != nil && fast?.next != nil
            
        return slow
    }
}
