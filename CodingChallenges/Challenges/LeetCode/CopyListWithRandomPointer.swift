//
//  CopyListWithRandomPointer.swift
//  CodingChallenges
//
//  Created by William Boles on 15/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/copy-list-with-random-pointer/
//dictionary
//linked list
struct CopyListWithRandomPointer {
    
    //Time: O(n)
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
