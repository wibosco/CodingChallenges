//
//  LinkedListIntersectingNode.swift
//  CodingChallenges
//
//  Created by William Boles on 30/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

//CtCI 2.7
class LinkedListIntersectingNode: NSObject {

    class func areIntersecting(linkedListA: SingleLinkedList, linkedListB: SingleLinkedList) -> Bool {
    
        var linkedListANode = linkedListA.head
        
        while linkedListANode != nil {
            
            var linkedListBNode = linkedListB.head
            
            while linkedListBNode != nil {
                
                if linkedListBNode ==  linkedListANode {
                    
                    return true
                }
                
                linkedListBNode = linkedListBNode?.next
            }
            
            linkedListANode = linkedListANode?.next
        }
        
        return false
    }
}
