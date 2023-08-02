//
//  PalindromeLinkedList.swift
//  LeetCode
//
//  Created by William Boles on 02/08/2023.
//

import Foundation

//https://leetcode.com/problems/palindrome-linked-list/
struct PalindromeLinkedList {
    
    //Time: O(n) where n is the number of nodes in the linked list
    //Space: O(1)
    //linked list
    //slow and fast pointers
    //reverse linked list
    //
    //Solution Description:
    //Using a fast and slow pointer we iterate through the list, leaving the slow pointer in the "middle" (or as near as possible
    //for an evenly numbered list). Treating the nodes up from `head` to just before `slow` as one list and from `slow` to the
    //tail as another list. We reverse the first list so that all nodes now point to their original predeccesors and the original
    //head of that sub list is now its tail. As it's possible for a palindrome to be either contain an odd or even number of
    //elements we check if we are dealing with an odd palindrome and move the `slow` pointer (which is the head of the second
    //list) rightwards by one node. Next we iterate through both lists and compare the values of each node against its
    //counterpart - if there is a mismatch we return false. If after iterating through all nodes, everything matches we return
    //true.
    static func isPalindrome(_ head: ListNode?) -> Bool {
        var fast = head
        var slow = head
        
        repeat {
            slow = slow?.next
            fast = fast?.next?.next
        } while fast != nil && fast?.next != nil
        
        //if the list contain 0 or 1 elements then we return true
        if slow == nil {
            return true
        }
        
        var current = head
        var prev: ListNode?
        
        while current !== slow { //note this is "!==" not just "!="
            let tempNext = current?.next
            
            current?.next = prev
            prev = current
            
            current = tempNext
        }
        
        //if the list contains an odd number of elements, the middle element is "shared" so should be skipped over
        if fast != nil {
            slow = slow?.next
        }
        
        var node1 = prev
        var node2 = slow
        
        while node1 != nil && node2 != nil {
            if node1?.val == node2?.val {
                node1 = node1?.next
                node2 = node2?.next
            } else {
                return false
            }
        }
        
        return true
    }
    
    //Time: O(n) where n is the number of nodes in the linked list
    //Space: O(n)
    //linked list
    //array
    //
    //Solution Description:
    //We iterate through the linked list and every node that we come to we store in `array`. Once all nodes have been added to `array`
    //we check if `array` is equal to itself reversed and return the result.
    static func isPalindromeExtraMemory(_ head: ListNode?) -> Bool {
        var array = [Int]()
        var node = head
        
        while let n = node {
            array.append(n.val)
            node = n.next
        }
        
        return array == array.reversed()
    }
}
