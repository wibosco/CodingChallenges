//
//  BinaryTreeLevelOrderTraversalIITests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 29/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class BinaryTreeLevelOrderTraversalIITests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [3, 9, 20, nil, nil, 15, 7]
        let root = BinaryTreeNode.deserialize(data)
        
        let order = BinaryTreeLevelOrderTraversalII.levelOrderBottom(root)
        
        XCTAssertEqual(order, [[15, 7], [9, 20], [3]])
    }
    
    func test_B() {
        let data = [1]
        let root = BinaryTreeNode.deserialize(data)
        
        let order = BinaryTreeLevelOrderTraversalII.levelOrderBottom(root)
        
        XCTAssertEqual(order, [[1]])
    }
    
    func test_C() {
        let data = [Int]()
        let root = BinaryTreeNode.deserialize(data)
        
        let order = BinaryTreeLevelOrderTraversalII.levelOrderBottom(root)
        
        XCTAssertEqual(order, [[Int]]())
    }
}
