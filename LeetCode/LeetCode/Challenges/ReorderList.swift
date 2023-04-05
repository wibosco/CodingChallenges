//
//  ReorderList.swift
//  LeetCode
//
//  Created by William Boles on 21/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/reorder-list/
//linked list
struct ReorderList {
    
    //Time: O(n)
    //Space: O(1)
    //no additional space
    //
    //Solution Description:
    //First we find the middle of the list and effectively split the list into two lists. Everything from the middle to end
    //is then reversed by getting the prev node and setting it as the `next` node of the current node. This two lists are
    //then merged together with each step taking the reversed list's node and making it the `next` node of the non-reversed
    //list. As we don't use an additional data structure to hold the list we need before re-assigning `next` we need to hold
    //onto the old `next` and attach it to the new `next` so we don't lose anything.
    static func reorderList(_ head: ListNode?) {
        var slow = head
        var fast = head
        
        //find middle node
        while fast?.next != nil { //Time: O(n)
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        //reverse
        var prev: ListNode?
        var cur: ListNode? = slow
        
        while cur != nil { //Time: O(n/2)
            let temp = cur?.next
            
            cur?.next = prev
            prev = cur
            cur = temp
        }
        
        var l1 = head
        var l2 = prev
        
        //merge
        while l2?.next != nil { //Time: O(n/2)
            let temp1 = l1?.next
            l1?.next = l2
            l1 = temp1
            
            let temp2 = l2?.next
            l2?.next = l1
            l2 = temp2
        }
        //remember that the final node of l1 will already be associated
        //with the final node of l2 due the original associated in the
        //unreversed list
    }
    
    //Time: O(n)
    //Space: O(n)
    //two pointers
    //array
    //
    //Solution Description:
    //Using an array to store all nodes in order we use two pointers to move through the array from opposite sides, overriding
    //the left nodes `next` property to now point at the right node
    static func reorderListTwoPointers(_ head: ListNode?) {
        var nodes = [ListNode]()
        var node: ListNode? = head
        
        while let n = node {
            nodes.append(n)
            node = n.next
        }
        
        var left = 0
        var right = nodes.count - 1
        
        while left < right {
            let leftNode = nodes[left]
            let rightNode = nodes[right]
            
            let temp = leftNode.next
            leftNode.next = rightNode
            rightNode.next = temp
            
            left += 1
            right -= 1
        }
        
        nodes[left].next = nil
    }
}
