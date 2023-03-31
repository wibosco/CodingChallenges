//
//  BinaryTreePreorderTraversal.swift
//  LeetCodeTests
//
//  Created by William Boles on 22/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class BinaryTreePreorderTraversalTests: XCTestCase {

    // MARK: - Tests

    func test_A() {
        let data = [1, nil, 2, 3]
        
        let root = BinaryTreeNode.deserialize(data)
        
        let traversal = BinaryTreePreorderTraversal.preorderTraversal(root)
        
        XCTAssertEqual(traversal, [1, 2, 3])
    }
    
    func test_B() {
        let data = [Int]()
        
        let root = BinaryTreeNode.deserialize(data)
        
        let traversal = BinaryTreePreorderTraversal.preorderTraversal(root)
        
        XCTAssertEqual(traversal, [Int]())
    }
    
    func test_C() {
        let data = [1]
        
        let root = BinaryTreeNode.deserialize(data)
        
        let traversal = BinaryTreePreorderTraversal.preorderTraversal(root)
        
        XCTAssertEqual(traversal, [1])
    }
    
    func test_D() {
        let data = [1, 2]
        
        let root = BinaryTreeNode.deserialize(data)
        
        let traversal = BinaryTreePreorderTraversal.preorderTraversal(root)
        
        XCTAssertEqual(traversal, [1, 2])
    }
    
    func test_E() {
        let data = [1, nil, 2]
        
        let root = BinaryTreeNode.deserialize(data)
        
        let traversal = BinaryTreePreorderTraversal.preorderTraversal(root)
        
        XCTAssertEqual(traversal, [1, 2])
    }
}
