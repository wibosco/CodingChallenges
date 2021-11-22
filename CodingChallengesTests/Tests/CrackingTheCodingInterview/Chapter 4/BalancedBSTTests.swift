//
//  BalancedBST.swift
//  CodingChallenges
//
//  Created by William Boles on 05/07/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class BalancedBSTTests: XCTestCase {
    
    // MARK: Tests
    
    func test_A() {
        let relationships = [[0,1],
                             [0,2],
                             [1,3],
                             [1,4],
                             [2,5],
                             [2,6]]
        
        let root = TreeNodeCtCI.createBinaryTree(fromRelationships: relationships)
        let isBalanced = BalancedBST.isBalancedBST(root: root)
        
        XCTAssertTrue(isBalanced)
    }
    
    func test_B() {
        let relationships = [[0,1],
                             [0,2],
                             [1,3],
                             [1,4],
                             [2,5],
                             [2,6],
                             [5,7],
                             [5,8]]
        
        let root = TreeNodeCtCI.createBinaryTree(fromRelationships: relationships)
        let isBalanced = BalancedBST.isBalancedBST(root: root)
        
        XCTAssertTrue(isBalanced)
    }
    
    func test_C() {
        let relationships = [[0,1],
                             [0,2],
                             [1,3],
                             [1,4],
                             [2,5],
                             [2,6],
                             [5,7],
                             [5,8],
                             [7,9],
                             [7,10]]
        
        let root = TreeNodeCtCI.createBinaryTree(fromRelationships: relationships)
        let isBalanced = BalancedBST.isBalancedBST(root: root)
        
        XCTAssertFalse(isBalanced)
    }
}
