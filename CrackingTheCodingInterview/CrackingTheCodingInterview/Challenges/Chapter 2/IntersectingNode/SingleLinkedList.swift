//
//  SingleLinkedList.swift
//  CrackingTheCodingInterview
//
//  Created by William Boles on 30/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

final class SingleLinkedList {
    var head: LinkedListNode?
    
    // MARK: - Add
    
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
