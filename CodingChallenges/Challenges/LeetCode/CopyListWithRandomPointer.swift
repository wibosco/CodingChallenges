//
//  CopyListWithRandomPointer.swift
//  CodingChallenges
//
//  Created by William Boles on 15/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/copy-list-with-random-pointer/
//linked list
struct CopyListWithRandomPointer {
    
    //Time: O(n) where n is the number of nodes in the list
    //Space: O(n) where n is the number of nodes in the list
    //dictionary
    //
    //Solution Description:
    //First we iterate through the linked list storing a copy each node into
    //a dictionary with the original node being used as the key (without
    //attempting to set the `next` or `random` properties). Next we iterate
    //through the original list again, this time setting the `next` and
    //`random` properties
    static func copyRandomList(_ head: ListNodeRandom?) -> ListNodeRandom? {
        guard let head = head else {
            return nil
        }
        
        var mapping = [ListNodeRandom: ListNodeRandom]()
        var originalNode: ListNodeRandom? = head
        while let on = originalNode {
            mapping[on] = ListNodeRandom(on.val)
            originalNode = on.next
        }
        
        originalNode = head
        while let on = originalNode {
            let mappedNode = mapping[on]!
            if let onn = on.next {
                mappedNode.next = mapping[onn]!
            }
            
            if let onr = on.random {
                mappedNode.random = mapping[onr]!
            }
            
            originalNode = on.next
        }
        
        return mapping[head]
    }
}
