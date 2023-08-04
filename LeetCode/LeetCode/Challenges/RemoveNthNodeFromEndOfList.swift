//
//  RemoveNthFromList.swift
//  LeetCode
//
//  Created by William Boles on 09/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/remove-nth-node-from-end-of-list/
struct RemoveNthNodeFromEndOfList {
    
    //Time: O(n) where n is the number of nodes in the list
    //Space: O(1)
    //linked list
    //two pointers
    //sentinel head
    //
    //Solution Description:
    //Using two offset pointers we iterate through the list keeping a distance of `n + 1` so that by the time the first pointer (`p1`)
    //reaches the end of list the second pointer (`p2`) is at the `nth - 1` node. We then set the `nth - 1` nodes `next` property to
    //point to the `nth + 1` node so removing the `nth` node from list. Special care needs to be taken if the `nth` node is the `head`
    //node to overcome we introduce a dummy node that we will place before `head` so we can still remove `head` if we need to without
    //introducing any complex logic.
    static func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard let head = head else {
            return nil
        }
        
        let dummy = ListNode(-1) //will allow us to remove the `head` node if needed
        dummy.next = head
        var p1: ListNode? = dummy
        var p2: ListNode? = dummy
        
        for _ in 0..<(n + 1) { //`n + 1` so `p2` will stop at the node before the `nth` node
            p1 = p1?.next
        }

        while p1 != nil {
            p1 = p1?.next
            p2 = p2?.next
        }
        
        p2?.next = p2?.next?.next
        
        return dummy.next
    }
    
    //Time: O(n) where n is the number of nodes in the list
    //Space: O(1)
    //linked list
    //2 passes
    //
    //Solution Description:
    //Iterating through the list we first count how many nodes are in the list and determine what the `nth` node would be. We then
    //iterate back through the list until we get the to the `nth - 1` node and then assign that `next` property of that node to the
    //`nth + 1` node so removing the `nth` node from list.
    static func removeNthFromEnd2Passes(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard let head = head else {
            return nil
        }
        
        var count = 0
        var node: ListNode? = head
        
        while let n = node {
            count += 1
            
            node = n.next
        }
        
        var nthIndex = count - n
        
        guard nthIndex > 0 else {
            return head.next
        }
        
        node = head
        
        while nthIndex > 1 {
            nthIndex -= 1
            
            node = node?.next
        }
        
        node?.next = node?.next?.next
        
        return head
    }
    
    //Time: O(n) where n is the number of nodes in the list
    //Space: O(n) 
    //linked list
    //array
    //
    //Solution Description:
    //Iterate through the list storing each node in an array (in the order we encounter them in). Next work out which index in `nodes`
    //is `Nth from end` and repoint the node `Nth - 1` to point to the `Nth + 1` node. Special care needs to be taken if the `Nth from
    //end` node is the head - in which case we don't need to repoint and can just return `head.next` as the new list head.
    static func removeNthFromEndArray(_ head: ListNode?, _ n: Int) -> ListNode? {
        var nodes = [ListNode]()
        
        var tail = head
        while let t = tail {
            nodes.append(t)
            
            tail = t.next
        }
        
        let nthIndex = nodes.count - n
        
        guard nthIndex > 0 else {
            return head?.next //Nth node is head so just need to skip it
        }
        
        let nthNode = nodes[nthIndex]
        let previousNthNode = nodes[(nthIndex - 1)]
        
        previousNthNode.next = nthNode.next
        
        return head
    }
}
