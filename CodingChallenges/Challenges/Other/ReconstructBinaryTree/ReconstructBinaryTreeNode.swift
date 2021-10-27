//
//  Node.swift
//  CodingChallenges
//
//  Created by William Boles on 29/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

class ReconstructBinaryTreeNode {

    // MARK: Properties
    
    var parent: ReconstructBinaryTreeNode?
    
    var left: ReconstructBinaryTreeNode?
    var right: ReconstructBinaryTreeNode?
    
    var value: Int
    
    // MARK: Init
    
    init(value: Int) {
        self.value = value
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
