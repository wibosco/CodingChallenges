//
//  SingleLinkedList.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 30/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

class SingleLinkedList: NSObject {
    
    // MARK: Properties
    
    var head: LinkedListNode?
    
    // MARK: Add
    
    func addNode(node: LinkedListNode) {
        
        if head == nil {
            
            head = node
        }
        else {
            
            var n = head!
            
            while n.next != nil {
                
                n = n.next!
            }
            
            n.next = node
        }
    }
}
