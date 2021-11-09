//
//  RotateList.swift
//  CodingChallenges
//
//  Created by William Boles on 09/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/rotate-list/
struct RotateList {
    // O(n)
    static func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard let head = head, head.next != nil, k > 0 else {
            return head
        }

        var nodes = [ListNode]()
        var node: ListNode? = head
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

