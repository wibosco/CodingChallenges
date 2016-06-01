//
//  BinarySearchTreeDepthLinkedList.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 01/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

class BinarySearchTreeDepthLinkedList: NSObject {

    // MARK: Properties
    
    var head: BinarySearchTreeDepthLinkedListNode?
    
    // MARK: Action
    
    func addNode(binarySearchNode: BinarySearchTreeDepthNode) {
        
        addNode(binarySearchNode, linkedListNode: head)
    }
    
    private func addNode(binarySearchNode: BinarySearchTreeDepthNode, linkedListNode: BinarySearchTreeDepthLinkedListNode?) {
        
        if let linkedListNode = linkedListNode {
            
            if linkedListNode.next == nil {
                
                let node = BinarySearchTreeDepthLinkedListNode()
                node.binarySearchTreeNode = binarySearchNode
                
                linkedListNode.next = node
            }
            else {
                
                addNode(binarySearchNode, linkedListNode: linkedListNode.next)
            }
        }
        else {
        
            let node = BinarySearchTreeDepthLinkedListNode()
            node.binarySearchTreeNode = binarySearchNode
            
            head = node
        }
    }
}
