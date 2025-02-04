//
//  MaximumDepthBinaryTreeTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 23/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class MaximumDepthBinaryTreeTests: XCTestCase {
    
     // MARK: - Test
    
    func test_A() {
        let data = [3, 9, 20, nil, nil, 15, 7]
        
        let root = TreeNode.deserialize(data)
        
        let result = MaximumDepthBinaryTree().maxDepth(root)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_B() {
        let data = [1, nil, 2]
        
        let root = TreeNode.deserialize(data)
        
        let result = MaximumDepthBinaryTree().maxDepth(root)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_C() {
        let data = [Int]()
        
        let root = TreeNode.deserialize(data)
        
        let result = MaximumDepthBinaryTree().maxDepth(root)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_D() {
        let data = [0]
        
        let root = TreeNode.deserialize(data)
        
        let result = MaximumDepthBinaryTree().maxDepth(root)
        
        XCTAssertEqual(result, 1)
    }
}
