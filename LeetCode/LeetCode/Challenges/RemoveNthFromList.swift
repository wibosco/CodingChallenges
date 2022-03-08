//
//  RemoveNthFromList.swift
//  CodingChallenges
//
//  Created by William Boles on 09/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/remove-nth-node-from-end-of-list/
//linked list
struct RemoveNthFromList {
    
    //Time: O(n) where `n` is the number of nodes in the list
    //Space: O(n) where `n` is the number of nodes in the list
    //array
    //
    //Solution Description:
    //Iterate through the list storing each node in an array (in the order we encounter them in). Next work out which index
    //in `nodes` is `Nth from end` and repoint the node `Nth - 1` to point to the `Nth + 1` node. Special care needs to
    //be taken if the `Nth from end` node is the head - in which case we don't need to repoint and can just return `head.next`
    //as the new list head
    static func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var nodes = [ListNode]()
        
        var tail = head
        while let t = tail {
            nodes.append(t)
            
            tail = t.next
        }
        
        let nIndex = nodes.count - n
        
        guard nIndex > 0 else {
            return head?.next //Nth node is head so just need to skip it
        }
        
        let nthNode = nodes[nIndex]
        let previousNthNode = nodes[(nIndex - 1)]
        
        previousNthNode.next = nthNode.next
        
        return head
    }
}
