//
//  BinarySearchTreeNode.swift
//  CodingChallenges
//
//  Created by William Boles on 31/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

class BinarySearchTreeNode {

    // MARK: Properties
    
    var value: Int
    var left: BinarySearchTreeNode?
    var right: BinarySearchTreeNode?
    
    // MARK: Inits
    
    init(value: Int) {
        self.value = value
    }
}
