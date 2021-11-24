//
//  BinaryTreeLevelOrderTraversalTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 22/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class BinaryTreeLevelOrderTraversalTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [3, 9, 20, nil, nil, 15, 7]
        
        let root = TreeNode.createBinaryTree(fromLevelOrderArray: data)
        
        let traversal = BinaryTreeLevelOrderTraversal.levelOrder(root)
        
        XCTAssertEqual(traversal, [[3], [9, 20], [15, 7]])
    }
    
    func test_B() {
        let data = [1]
        
        let root = TreeNode.createBinaryTree(fromLevelOrderArray: data)
        
        let traversal = BinaryTreeLevelOrderTraversal.levelOrder(root)
        
        XCTAssertEqual(traversal, [[1]])
    }
                                   
    func test_C() {
        let data = [Int]()
        
        let root = TreeNode.createBinaryTree(fromLevelOrderArray: data)
        
        let traversal = BinaryTreeLevelOrderTraversal.levelOrder(root)
        
        XCTAssertEqual(traversal, [])
    }
    
    func test_D() {
        let data = [1, 2, 3, 4, nil, nil, 5]
        
        let root = TreeNode.createBinaryTree(fromLevelOrderArray: data)
        
        let traversal = BinaryTreeLevelOrderTraversal.levelOrder(root)
        
        XCTAssertEqual(traversal, [[1], [2, 3], [4, 5]])
    }
}
