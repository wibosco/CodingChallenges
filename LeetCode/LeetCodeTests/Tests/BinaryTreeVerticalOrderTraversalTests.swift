//
//  BinaryTreeVerticalOrderTraversalTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 29/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

class BinaryTreeVerticalOrderTraversalTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [3, 9, 20, nil, nil, 15, 7]
        let root = BinaryTreeNode.deserialize(data)
        
        let order = BinaryTreeVerticalOrderTraversal.verticalOrder(root)
        
        XCTAssertEqual(order, [[9], [3, 15], [20], [7]])
    }
    
    func test_B() {
        let data = [3, 9, 8, 4, 0, 1, 7]
        let root = BinaryTreeNode.deserialize(data)
        
        let order = BinaryTreeVerticalOrderTraversal.verticalOrder(root)
        
        XCTAssertEqual(order, [[4], [9], [3, 0, 1], [8], [7]])
    }
    
    func test_C() {
        let data = [3, 9, 8, 4, 0, 1, 7, nil, nil, nil, 2, 5]
        let root = BinaryTreeNode.deserialize(data)
        
        let order = BinaryTreeVerticalOrderTraversal.verticalOrder(root)
        
        XCTAssertEqual(order, [[4], [9, 5], [3, 0, 1], [8, 2], [7]])
    }
    
    func test_D() {
        let data = [3, 9, 8, 4, 0, 1, 7]
        let root = BinaryTreeNode.deserialize(data)
        
        let order = BinaryTreeVerticalOrderTraversal.verticalOrder(root)
        
        XCTAssertEqual(order, [[4], [9], [3, 0, 1], [8], [7]])
    }
    
    func test_E() {
        let data = [3, 9, 8, 4, 0, 1, 7, nil, nil, nil, 2, 5]
        let root = BinaryTreeNode.deserialize(data)
        
        let order = BinaryTreeVerticalOrderTraversal.verticalOrder(root)
        
        XCTAssertEqual(order, [[4], [9, 5], [3, 0, 1], [8, 2], [7]])
    }
    
    func test_F() {
        let order = BinaryTreeVerticalOrderTraversal.verticalOrder(nil)
        
        XCTAssertEqual(order, [[Int]]())
    }
}
