//
//  RemoveNthFromList.swift
//  CodingChallenges
//
//  Created by William Boles on 09/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/remove-nth-node-from-end-of-list/
struct RemoveNthFromList {
    
    //O(n)
    static func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var nodes = [ListNode]()
        var node = head
        while let n = node {
            nodes.append(n)
            node = n.next
        }
        
        let index = nodes.count - n
        let nodeToBeRemoved = nodes[index]
        if index != 0 {
            nodes[index - 1].next = nodeToBeRemoved.next
        }
        
        nodes.remove(at: index)
        
        return nodes.first
    }
}
