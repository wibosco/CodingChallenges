//
//  BalancedBST.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 05/07/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class BalancedBSTTests: XCTestCase {
    
    // MARK: Tests
    
    func test_balancedBSTA() {
        let relationships = [[0,1],
                             [0,2],
                             [1,3],
                             [1,4],
                             [2,5],
                             [2,6]]
        
        let root = BalancedBSTFactory.buildBinaryTree(relationships: relationships)
        let isBalanced = BalancedBST.isBalancedBST(root: root)
        
        XCTAssertTrue(isBalanced)
    }
    
    func test_balancedBSTB() {
        let relationships = [[0,1],
                             [0,2],
                             [1,3],
                             [1,4],
                             [2,5],
                             [2,6],
                             [5,7],
                             [5,8]]
        
        let root = BalancedBSTFactory.buildBinaryTree(relationships: relationships)
        let isBalanced = BalancedBST.isBalancedBST(root: root)
        
        XCTAssertTrue(isBalanced)
    }
    
    func test_balancedBSTC() {
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
        
        let root = BalancedBSTFactory.buildBinaryTree(relationships: relationships)
        let isBalanced = BalancedBST.isBalancedBST(root: root)
        
        XCTAssertFalse(isBalanced)
    }
}
