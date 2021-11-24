//
//  BinaryTreePostorderTraversalTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 22/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class BinaryTreePostorderTraversalTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [1, nil, 2, 3]
        
        let root = TreeNode.createBinaryTree(fromLevelOrderArray: data)
        
        let traversal = BinaryTreePostorderTraversal.postorderTraversal(root)
        
        XCTAssertEqual(traversal, [3, 2, 1])
    }
    
    func test_B() {
        let data = [Int]()
        
        let root = TreeNode.createBinaryTree(fromLevelOrderArray: data)
        
        let traversal = BinaryTreePostorderTraversal.postorderTraversal(root)
        
        XCTAssertEqual(traversal, [Int]())
    }
    
    func test_C() {
        let data = [1]
        
        let root = TreeNode.createBinaryTree(fromLevelOrderArray: data)
        
        let traversal = BinaryTreePostorderTraversal.postorderTraversal(root)
        
        XCTAssertEqual(traversal, [1])
    }
    
    func test_D() {
        let data = [1, 2]
        
        let root = TreeNode.createBinaryTree(fromLevelOrderArray: data)
        
        let traversal = BinaryTreePostorderTraversal.postorderTraversal(root)
        
        XCTAssertEqual(traversal, [2, 1])
    }
    
    func test_E() {
        let data = [1, nil, 2]
        
        let root = TreeNode.createBinaryTree(fromLevelOrderArray: data)
        
        let traversal = BinaryTreePostorderTraversal.postorderTraversal(root)
        
        XCTAssertEqual(traversal, [2, 1])
    }
}
