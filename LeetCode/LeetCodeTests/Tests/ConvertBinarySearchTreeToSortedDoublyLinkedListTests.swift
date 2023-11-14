//
//  ConvertBinarySearchTreeToSortedDoublyLinkedListTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 11/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class ConvertBinarySearchTreeToSortedDoublyLinkedListTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let data = [4, 2, 5, 1, 3]
        let root = TreeNode.deserialize(data)
        
        let head = ConvertBinarySearchTreeToSortedDoublyLinkedList.treeToDoublyList(root)
        
        let result = TreeNode.serializeAsDoublyLinkedList(head)
        
        XCTAssertEqual(result, [1, 2, 3, 4, 5])
    }
    
    func test_B() {
        let data = [2, 1, 3]
        let root = TreeNode.deserialize(data)
        
        let head = ConvertBinarySearchTreeToSortedDoublyLinkedList.treeToDoublyList(root)
        
        let result = TreeNode.serializeAsDoublyLinkedList(head)
        
        XCTAssertEqual(result, [1, 2, 3])
    }
}
