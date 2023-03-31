//
//  MinimalBinarySearchTreeNode.swift
//  CodingChallenges
//
//  Created by William Boles on 01/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

final class MinimalBinarySearchTreeNode {

    // MARK: Properties
    
    var value: Int
    
    var left: MinimalBinarySearchTreeNode?
    var right: MinimalBinarySearchTreeNode?
    
    // MARK: Init
    
    init(value: Int) {
        self.value = value
    }
    
    // MARK: Child
    
    func addChild(node: MinimalBinarySearchTreeNode) {
        if node.value <= self.value {
            left = node
        } else {
            right = node
        }
    }
}
