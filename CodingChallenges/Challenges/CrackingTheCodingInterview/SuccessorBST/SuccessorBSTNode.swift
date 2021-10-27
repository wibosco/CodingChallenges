//
//  SuccessorBSTNode.swift
//  CodingChallenges
//
//  Created by William Boles on 05/07/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

class SuccessorBSTNode {
    var value: Int
    var parent: SuccessorBSTNode?
    var left: SuccessorBSTNode?
    var right: SuccessorBSTNode?
    
    // MARK: Lifecycle
    
    init(value: Int) {
        self.value = value
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

extension SuccessorBSTNode: Equatable {
    static func == (lhs: SuccessorBSTNode, rhs: SuccessorBSTNode) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}
