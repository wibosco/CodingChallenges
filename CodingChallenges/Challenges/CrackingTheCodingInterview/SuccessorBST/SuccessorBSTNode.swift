//
//  SuccessorBSTNode.swift
//  CodingChallenges
//
//  Created by William Boles on 05/07/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

class SuccessorBSTNode: NSObject {

    // MARK: Properties
    
    var value: Int
    var parent: SuccessorBSTNode?
    var left: SuccessorBSTNode?
    var right: SuccessorBSTNode?
    
    // MARK: Lifecycle
    
    init(value: Int) {
        self.value = value
        super.init()
    }
    
    // MARK: Nodes
    
    func addNodeAsChild(node: SuccessorBSTNode) {
        if left == nil {
            left = node
        } else {
            right = node
        }
        
        node.parent = self
    }
}
