//
//  FlattenBinaryTreeToLinkedListTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 08/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class FlattenBinaryTreeToLinkedListTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [1, 2, 5, 3, 4, nil, 6]
        
        let root = BinaryTreeNode.deserialize(data)
        
        FlattenBinaryTreeToLinkedList.flatten(root)
        
        let result = BinaryTreeNode.serialize(root)
        
        XCTAssertEqual(result, [1, nil, 2, nil, 3, nil, 4, nil, 5, nil, 6])
    }
    
    func test_B() {
        let data = [Int]()
        
        let root = BinaryTreeNode.deserialize(data)
        
        FlattenBinaryTreeToLinkedList.flatten(root)
        
        let result = BinaryTreeNode.serialize(root)
        
        XCTAssertEqual(result, [])
    }
    
    func test_C() {
        let data = [0]
        
        let root = BinaryTreeNode.deserialize(data)
        
        FlattenBinaryTreeToLinkedList.flatten(root)
        
        let result = BinaryTreeNode.serialize(root)
        
        XCTAssertEqual(result, [0])
    }
}
