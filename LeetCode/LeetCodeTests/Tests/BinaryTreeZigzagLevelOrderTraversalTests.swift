//
//  BinaryTreeZigzagLevelOrderTraversalTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 28/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class BinaryTreeZigzagLevelOrderTraversalTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [3, 9, 20, nil, nil, 15, 7]
        let root = BinaryTreeNode.deserialize(data)
        
        let result = BinaryTreeZigzagLevelOrderTraversal.zigzagLevelOrder(root)
        
        XCTAssertEqual(result, [[3], [20, 9], [15, 7]])
    }
    
    func test_B() {
        let data = [1]
        let root = BinaryTreeNode.deserialize(data)
        
        let result = BinaryTreeZigzagLevelOrderTraversal.zigzagLevelOrder(root)
        
        XCTAssertEqual(result, [[1]])
    }
    
    func test_C() {
        let data = [Int?]()
        let root = BinaryTreeNode.deserialize(data)
        
        let result = BinaryTreeZigzagLevelOrderTraversal.zigzagLevelOrder(root)
        
        XCTAssertEqual(result, [[Int]]())
    }
}
