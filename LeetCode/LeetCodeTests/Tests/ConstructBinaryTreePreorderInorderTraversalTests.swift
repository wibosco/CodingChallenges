//
//  ConstructBinaryTreePreorderInorderTraversal.swift
//  LeetCodeTests
//
//  Created by William Boles on 24/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class ConstructBinaryTreePreorderInorderTraversalTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let preorder = [3, 9, 20, 15, 7]
        let inorder = [9, 3, 15, 20, 7]
        
        let root = ConstructBinaryTreePreorderInorderTraversal.buildTree(preorder, inorder)
        
        let result = BinaryTreeNode.serialize(root)
        
        XCTAssertEqual(result, [3, 9, 20, nil, nil, 15, 7])
    }
    
    func test_B() {
        let preorder = [-1]
        let inorder = [-1]
        
        let root = ConstructBinaryTreePreorderInorderTraversal.buildTree(preorder, inorder)
        
        let result = BinaryTreeNode.serialize(root)
        
        XCTAssertEqual(result, [-1])
    }
    
    func test_C() {
        let preorder = [1, 2]
        let inorder = [1, 2]
        
        let root = ConstructBinaryTreePreorderInorderTraversal.buildTree(preorder, inorder)
        
        let result = BinaryTreeNode.serialize(root)
        
        XCTAssertEqual(result, [1, nil, 2])
    }
    
    func test_D() {
        let preorder = [3, 1, 2, 4]
        let inorder =  [1, 2, 3, 4]
        
        let root = ConstructBinaryTreePreorderInorderTraversal.buildTree(preorder, inorder)
        
        let result = BinaryTreeNode.serialize(root)
        
        XCTAssertEqual(result, [3, 1, 4, nil, 2])
    }
}
