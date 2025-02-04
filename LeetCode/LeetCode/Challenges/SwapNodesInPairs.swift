//
//  SwapNodesInPairs.swift
//  LeetCode
//
//  Created by William Boles on 16/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation
import UIKit

//https://leetcode.com/problems/swap-nodes-in-pairs/
struct SwapNodesInPairs {
    
    //Time: O(n) where n is the number of nodes in the list
    //Space: O(1)
    //linked list
    //iterative
    //sentinel head
    //
    //Solution Description:
    //Iterate through the list, in order to swap to adjunct nodes we need to keep track of two nodes: `n - 1` and
    //`n`. First we attach `n + 1` as the next node of `n - 1`, then we set the next property on node `n` to
    //point to `n + 2`, then we set the next property of node `n + 1` to point to node `n`. All that left to do is
    //move the the `current` and `previous` node pointers so `previous` is now node `n` and `current` is node
    //`n + 2`. We repeat this process until we reach the end of the list, we can then return the `next` node of
    //our dummy/sentinel holding node.
    func swapPairs(_ head: ListNode?) -> ListNode? {
        let sentinel = ListNode(-1)
        var previous: ListNode? = sentinel
        var current = head
        
        while current != nil {
            guard let next = current?.next else {
                previous?.next = current //edge case for where the list only contains one node
                break
            }
            
            previous?.next = next
            current?.next = next.next
            next.next = current
            
            previous = current
            current = current?.next
        }
        
        return sentinel.next
    }
    
    //Time: O(n) where n is the number of nodes in the list
    //Space: O(n) if counting the recursive stack otherwise O(1)
    //linked list
    //recursive
    //
    //Solution Description:
    //Iterate through the list, swapping the `head` with the `next` node so that `next` -> `head` and then recursively call
    //swap on the next two nodes. At the end we return the `next` node which is now the `head` node of the pair, the
    //returned `node` is then used as the next node of the old `head` so that all nodes are joined to another node (apart
    //from the end node)
    func swapPairsRecursive(_ head: ListNode?) -> ListNode? {
        return swapPairs(head, head?.next)
    }
    
    private func swapPairs(_ head: ListNode?, _ next: ListNode?) -> ListNode? {
        guard let head = head else {
            return nil
        }
        
        guard let next = head.next else {
            return head
        }
        
        let nextNext = next.next
        next.next = head
        
        head.next = swapPairs(nextNext, nextNext?.next)
        
        return next
    }
}
