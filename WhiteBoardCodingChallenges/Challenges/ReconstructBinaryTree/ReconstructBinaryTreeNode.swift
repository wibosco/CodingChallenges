//
//  Node.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 29/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

class ReconstructBinaryTreeNode: NSObject {

    // MARK: Properties
    
    var parent: ReconstructBinaryTreeNode?
    
    var left: ReconstructBinaryTreeNode?
    var right: ReconstructBinaryTreeNode?
    
    var value: Int
    
    // MARK: Init
    
    init(value: Int) {
        
        self.value = value
        
        super.init()
    }
    
    // MARK: Value
    
    func hasValueAsNodeChild(value: Int) -> ReconstructBinaryTreeNode? {
        
        if left?.value == value {
            
            return left
        }
        
        if right?.value == value {
            
            return right
        }
        
        return nil
    }
    
    // MARK: Nodes
    
    func addNodeAsChild(node: ReconstructBinaryTreeNode) {
        
        if left == nil {
            
            left = node
        }
        else {
            
            right = node
        }
        
        node.parent = self
    }
    
}
