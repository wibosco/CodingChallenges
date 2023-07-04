//
//  SubtreeOfAnotherTreeTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 26/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class SubtreeOfAnotherTreeTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [3, 4, 5, 1, 2]
        let subData = [4, 1, 2]
        
        let root = BinaryTreeNode.deserialize(data)
        let subRoot = BinaryTreeNode.deserialize(subData)
        
        let result = SubtreeOfAnotherTree.isSubtree(root, subRoot)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let data = [3, 4, 5, 1, 2, nil, nil, nil, nil, 0]
        let subData = [4, 1, 2]
        
        let root = BinaryTreeNode.deserialize(data)
        let subRoot = BinaryTreeNode.deserialize(subData)
        
        let result = SubtreeOfAnotherTree.isSubtree(root, subRoot)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let data = [1, 1]
        let subData = [1]
        
        let root = BinaryTreeNode.deserialize(data)
        let subRoot = BinaryTreeNode.deserialize(subData)
        
        let result = SubtreeOfAnotherTree.isSubtree(root, subRoot)
        
        XCTAssertTrue(result)
    }
    
    func test_D() {
        let data = [-1, -4, 8, -6, -2, 3, 9, nil, -5, nil, nil, 0, 7]
        let subData = [3, 0, 5848]
        
        let root = BinaryTreeNode.deserialize(data)
        let subRoot = BinaryTreeNode.deserialize(subData)
        
        let result = SubtreeOfAnotherTree.isSubtree(root, subRoot)
        
        XCTAssertFalse(result)
    }
    
    func test_E() {
        let data = [3, 4, 5, 1, 2]
        let subData = [4, 1, nil, nil, 2]
        
        let root = BinaryTreeNode.deserialize(data)
        let subRoot = BinaryTreeNode.deserialize(subData)
        
        let result = SubtreeOfAnotherTree.isSubtree(root, subRoot)
        
        XCTAssertFalse(result)
    }
}
