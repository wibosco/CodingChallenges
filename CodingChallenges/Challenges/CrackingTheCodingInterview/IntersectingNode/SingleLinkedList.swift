//
//  SingleLinkedList.swift
//  CodingChallenges
//
//  Created by William Boles on 30/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

class SingleLinkedList {
    
    // MARK: Properties
    
    var head: LinkedListNode?
    
    // MARK: Add
    
    func addNode(node: LinkedListNode) {
        guard var head = head else {
            self.head = node
            return
        }
        
        while head.next != nil {
            head = head.next!
        }
        head.next = node
    }
}
