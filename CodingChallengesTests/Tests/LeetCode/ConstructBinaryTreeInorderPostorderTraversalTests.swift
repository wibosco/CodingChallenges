//
//  ConstructBinaryTreeInorderPostorderTraversalTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 24/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class ConstructBinaryTreeInorderPostorderTraversalTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let inorder = [9, 3, 15, 20, 7]
        let postorder = [9, 15, 7, 20, 3]
        
        let root = ConstructBinaryTreeInorderPostorderTraversal.buildTree(inorder, postorder)
        
        let levelOrder = TreeNode.extractValuesInLevelOrder(fromBinaryTree: root)
        
        XCTAssertEqual(levelOrder, [3, 9, 20, 15, 7]) //[3, 9, 20, nil, nil, 15, 7]
    }
    
    func test_B() {
        let inorder = [-1]
        let postorder = [-1]
        
        let root = ConstructBinaryTreeInorderPostorderTraversal.buildTree(inorder, postorder)
        
        let levelOrder = TreeNode.extractValuesInLevelOrder(fromBinaryTree: root)
        
        XCTAssertEqual(levelOrder, [-1])
    }
    
    func test_C() {
        let inorder = [1, 2]
        let postorder = [2, 1]
        
        let root = ConstructBinaryTreeInorderPostorderTraversal.buildTree(inorder, postorder)
        
        let levelOrder = TreeNode.extractValuesInLevelOrder(fromBinaryTree: root)
        
        XCTAssertEqual(levelOrder, [1, 2]) //[1, nil, 2]
    }
}
