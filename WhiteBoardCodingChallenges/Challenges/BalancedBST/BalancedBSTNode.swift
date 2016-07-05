//
//  BalancedBSTNode.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 05/07/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

class BalancedBSTNode: NSObject {

    // MARK: Properties
    
    var value: Int
    var parent: BalancedBSTNode?
    var left: BalancedBSTNode?
    var right: BalancedBSTNode?
    var height = 0
    
    // MARK: Lifecycle
    
    init(value: Int) {
        self.value = value
        super.init()
    }
    
    // MARK: Nodes
    
    func addNodeAsChild(node: BalancedBSTNode) {
        if left == nil {
            left = node
        } else {
            right = node
        }
        
        node.parent = self
    }
}
