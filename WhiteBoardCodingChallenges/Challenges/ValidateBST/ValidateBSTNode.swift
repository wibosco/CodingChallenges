//
//  ValidateBSTNode.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 02/07/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

class ValidateBSTNode: NSObject {

    // MARK: Properties
    
    var value: Int
    var parent: ValidateBSTNode?
    var left: ValidateBSTNode?
    var right: ValidateBSTNode?
    
    // MARK: Lifecycle
    
    init(value: Int) {
        self.value = value
        super.init()
    }
    
    // MARK: Nodes
    
    func addNodeAsChild(node: ValidateBSTNode) {
        if left == nil {
            left = node
        } else {
            right = node
        }
        
        node.parent = self
    }
}
