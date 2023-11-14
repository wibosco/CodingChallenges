//
//  BinaryTreeVerticalOrderTraversalTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 29/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class BinaryTreeVerticalOrderTraversalTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [3, 9, 20, nil, nil, 15, 7]
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreeVerticalOrderTraversal.verticalOrder(root)
        
        XCTAssertEqual(result, [[9], [3, 15], [20], [7]])
    }
    
    func test_B() {
        let data = [3, 9, 8, 4, 0, 1, 7]
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreeVerticalOrderTraversal.verticalOrder(root)
        
        XCTAssertEqual(result, [[4], [9], [3, 0, 1], [8], [7]])
    }
    
    func test_C() {
        let data = [3, 9, 8, 4, 0, 1, 7, nil, nil, nil, 2, 5]
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreeVerticalOrderTraversal.verticalOrder(root)
        
        XCTAssertEqual(result, [[4], [9, 5], [3, 0, 1], [8, 2], [7]])
    }
    
    func test_D() {
        let data = [3, 9, 8, 4, 0, 1, 7]
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreeVerticalOrderTraversal.verticalOrder(root)
        
        XCTAssertEqual(result, [[4], [9], [3, 0, 1], [8], [7]])
    }
    
    func test_E() {
        let data = [3, 9, 8, 4, 0, 1, 7, nil, nil, nil, 2, 5]
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreeVerticalOrderTraversal.verticalOrder(root)
        
        XCTAssertEqual(result, [[4], [9, 5], [3, 0, 1], [8, 2], [7]])
    }
    
    func test_F() {
        let result = BinaryTreeVerticalOrderTraversal.verticalOrder(nil)
        
        XCTAssertEqual(result, [[Int]]())
    }
}
