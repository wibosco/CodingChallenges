//
//  SwapNodesInPairs.swift
//  CodingChallenges
//
//  Created by William Boles on 16/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation
import UIKit

//https://leetcode.com/problems/swap-nodes-in-pairs/
//linked list
struct SwapNodesInPairs {
    
    //Time: O(n) where `n` is the number of nodes in the list
    //Sapce: O(n) if counting the recusive stack otherwise O(1)
    //recusive
    //
    //Solution Description:
    //Iterate through the list, swaping the `head` with the `next` node so that `next` -> `head` and
    //then recusively call swap on the next two nodes. At the end we return the `next` node which is
    //now the `head` node of the pair, the returned `node` is then used as the next node of the old
    //`head` so that all nodes are joined to another node (apart from the end node)
    static func swapPairs(_ head: ListNode?) -> ListNode? {
        return swapPairs(head, head?.next)
    }
    
    private static func swapPairs(_ head: ListNode?, _ next: ListNode?) -> ListNode? {
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
