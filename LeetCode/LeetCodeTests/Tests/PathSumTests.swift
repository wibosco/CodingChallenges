//
//  PathSumTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 24/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class PathSumTests: XCTestCase {

   // MARK: - Tests
    
    func test_A() {
        let data = [5, 4, 8, 11, nil, 13, 4, 7, 2, nil, nil, nil, 1]
        let targetSum = 22
        
        let root = BinaryTreeNode.deserialize(data)
        
        let result = PathSum.hasPathSum(root, targetSum)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let data = [1, 2, 3]
        let targetSum = 5
        
        let root = BinaryTreeNode.deserialize(data)
        
        let result = PathSum.hasPathSum(root, targetSum)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let data = [-2, nil, -3]
        let targetSum = -5
        
        let root = BinaryTreeNode.deserialize(data)
        
        let result = PathSum.hasPathSum(root, targetSum)
        
        XCTAssertTrue(result)
    }
}
