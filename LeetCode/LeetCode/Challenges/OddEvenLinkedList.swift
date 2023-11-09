//
//  OddEvenLinkedList.swift
//  LeetCode
//
//  Created by William Boles on 07/04/2023.
//

import Foundation

//https://leetcode.com/problems/odd-even-linked-list/
struct OddEvenLinkedList {
    
    //Time: O(n) where n is the number of nodes in the list
    //Space: O(1)
    //linked list
    //three pointers
    //
    //Solution Description:
    //Using three pointer we split the even nodes off into a different list (kind of) and gradually add node to that even list. When
    //removing nodes from the original list we reattach the previous node to the next node as both these nodes are/where odd. Due to us
    //moving nodes with ever iteration we don't we are able to perform the same operation each time. When all nodes are move we effectively
    //have an odd list and an even list so we reattached the even nodes to the end of the odd list.
    static func oddEvenList(_ head: ListNode?) -> ListNode? {
        var oddTail = head
        let evenHead = head?.next //a pointer holding a reference to the start of the even nodes
        var evenTail = head?.next
        
        while evenTail?.next != nil {
            oddTail?.next = evenTail?.next //skip over the even node and attach the two odd nodes together
            oddTail = oddTail?.next
            
            evenTail?.next = oddTail?.next
            evenTail = evenTail?.next
        }
        
        oddTail?.next = evenHead
        
        return head
    }
    
    //Time: O(n) where n is the number of nodes in the list
    //Space: O(1)
    //linked list
    //three pointers
    //
    //Solution Description:
    //First we find the tail of the list. Using three pointers (`tail`, `odd` and `even`) we iterate through the list and move the even
    //nodes to the end of the list so that when we move `odd` onto the `tail` node we can exit the loop with all the odd nodes coming
    //before the even nodes.
    static func oddEvenListTail(_ head: ListNode?) -> ListNode? {
        var tail = head
        
        while let next = tail?.next {
            tail = next
        }

        var odd = head
        var even = tail
                
        while odd != tail && odd != tail?.next { //make sure we don't skip over the stop node
            even?.next = odd?.next //skip over the odd node and attach the even node to the end of the even nodes
            even = even?.next
            
            odd?.next = even?.next
            odd = odd?.next
        }
        
        even?.next = nil
        
        return head
    }
}
