//
//  BinarySearchTreeDepthNode.swift
//  CodingChallenges
//
//  Created by William Boles on 01/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

class BinarySearchTreeDepthNode {

    // MARK: Properties
    
    var value: Int
    var depth: Int
    
    var left: BinarySearchTreeDepthNode?
    var right: BinarySearchTreeDepthNode?
    
    // MARK: Init
    
    init(value: Int, depth: Int) {
        self.value = value
        self.depth = depth
    }
}
