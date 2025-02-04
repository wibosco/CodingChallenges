//
//  RotateList.swift
//  LeetCode
//
//  Created by William Boles on 09/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/rotate-list/
struct RotateList {
    
    //Time: O(n) where n ia the number of nodes in the list
    //Space: O(1)
    //linked list
    //two pointers
    //modulo
    //
    //Solution Description:
    //Iterate through the list finding it's tail and the number of nodes in that list. Use modulo to rebase `k` to the `count`
    //number base. Attach the existing tail to the head (forming a temp ring). Using two pointer iterate through the list finding
    //the new tail and new head. Break the existing existing connection between new tail and new head (breaking the ring) and return
    //the new head.
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard head != nil, head?.next != nil, k > 0 else {
            return head
        }
        
        var tail: ListNode? = head
        var count = 1

        while tail?.next != nil {
            tail = tail?.next
            
            count += 1
        }
        
        let rotations = count - (k % count)
        guard rotations > 0 else { //no rotation required
            return head
        }
        
        tail?.next = head //there will be a new tail and new head so we need to join the old ones together
        
        var newTail = head //slow, will always be one behind `newHead`
        var newHead = head //fast
        
        for _ in 0..<rotations {
            newTail = newHead
            newHead = newHead?.next
        }
        
        newTail?.next = nil //break existing connection between new tail and it's old next node
        
        return newHead
    }
    
    //Time: O(n) where n ia the number of nodes in the list
    //Space: O(n)
    //linked list
    //array
    //modulo
    //
    //Solution Description:
    //Build an array containing all the list nodes. Use modulo to wrap rotation shift around the array, taking care to break
    //the last node from the new head node (as this is now the tail) and attaching the old tail to the next node i.e. the first
    //node in the array (old head)
    func rotateRightArray(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard head != nil, head?.next != nil, k > 0 else {
            return head
        }

        var nodes = [ListNode]()
        var node = head
        while let n = node {
            nodes.append(n)
            node = n.next
        }

        let rotatedK = k % nodes.count
        guard rotatedK > 0 else { //being rotated back the lists starting position
            return head
        }
        
        nodes.last?.next = nodes.first //there will be a new tail and new head so we need to join the old ones together
        
        let newHeadIndex = nodes.count - rotatedK
        nodes[(newHeadIndex - 1)].next = nil //break existing connection between new tail and it's old next node

        return nodes[newHeadIndex]
    }
}
