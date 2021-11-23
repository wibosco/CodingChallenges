//
//  MaximumDepthBinaryTreeTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 23/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class MaximumDepthBinaryTreeTests: XCTestCase {
    
    // MARK: - Test
    
    func test_A() {
        let data = [3, 9, 20, nil, nil, 15, 7]
        
        let root = TreeNode.createBinaryTree(fromBFSArray: data)
        
        let maxDepth = MaximumDepthBinaryTree.maxDepth(root)
        
        XCTAssertEqual(maxDepth, 3)
    }
    
    func test_B() {
        let data = [1, nil, 2]
        
        let root = TreeNode.createBinaryTree(fromBFSArray: data)
        
        let maxDepth = MaximumDepthBinaryTree.maxDepth(root)
        
        XCTAssertEqual(maxDepth, 2)
    }
    
    func test_C() {
        let data = [Int]()
        
        let root = TreeNode.createBinaryTree(fromBFSArray: data)
        
        let maxDepth = MaximumDepthBinaryTree.maxDepth(root)
        
        XCTAssertEqual(maxDepth, 0)
    }
    
    func test_D() {
        let data = [0]
        
        let root = TreeNode.createBinaryTree(fromBFSArray: data)
        
        let maxDepth = MaximumDepthBinaryTree.maxDepth(root)
        
        XCTAssertEqual(maxDepth, 1)
    }
    
}
