//
//  RotateList.swift
//  CodingChallenges
//
//  Created by William Boles on 09/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/rotate-list/
//linked list
//array
//modulo
struct RotateList {
    
    //Time: O(n)
    //Space: O(n)
    //
    //Solution Description:
    //1. Buils an array contain nodes
    //2. Use modulo to wrap rotation shift around the array
    static func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard head != nil, head?.next != nil, k > 0 else {
            return head
        }

        var nodes = [ListNode]()
        var node = head
        while let n = node {
            nodes.append(n)
            node = n.next
        }

        let mapped = k % nodes.count
        if mapped == 0 {
            return head
        }
        
        let newHeadIndex = nodes.count - mapped
        nodes[(newHeadIndex - 1)].next = nil
        nodes.last?.next = head

        return nodes[newHeadIndex]
    }
}

