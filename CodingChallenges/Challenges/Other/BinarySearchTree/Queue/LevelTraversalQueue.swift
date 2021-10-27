//
//  LevelTraversalQueue.swift
//  CodingChallenges
//
//  Created by William Boles on 31/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

class LevelTraversalQueue: NSObject {

    // MARK: Properties
    
    lazy var nodes: [BinarySearchTreeNode] = {
        
        return [BinarySearchTreeNode]()
    }()
    
    // MARK: Enqueue
    
    func enqueue(node: BinarySearchTreeNode) {
        
        nodes.append(node)
    }
    
    func dequeue() -> BinarySearchTreeNode {
        
        return nodes.removeFirst()
    }
    
    // MARK: Empty
    
    func isEmpty() -> Bool {
        
        return nodes.count == 0
    }
}
