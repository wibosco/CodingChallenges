//
//  CloneBinaryTreeWithRandomPointerTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 10/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class CloneBinaryTreeWithRandomPointerTests: XCTestCase {

    // MARK: - Tests

    func test_A() {
        let data = [[1, nil], nil, [4, 3], [7, 0]]
        
        let root = TreeNodeRandom.deserialize(data)
        
        let clone = CloneBinaryTreeWithRandomPointer.copyRandomBinaryTree(root)
        
        let result = TreeNodeRandom.serialize(clone)
        
        XCTAssertEqual(result, data)
    }
    
    func test_B() {
        let data = [[1, 4], nil, [1, 0], nil, [1, 5], [1, 5]]
        
        let root = TreeNodeRandom.deserialize(data)
        
        let clone = CloneBinaryTreeWithRandomPointer.copyRandomBinaryTree(root)
        
        let result = TreeNodeRandom.serialize(clone)
        
        XCTAssertEqual(result, data)
    }
    
    func test_C() {
        let data = [[1, 6], [2, 5], [3, 4], [4, 3], [5, 2], [6, 1], [7, 0]]
        
        let root = TreeNodeRandom.deserialize(data)
        
        let clone = CloneBinaryTreeWithRandomPointer.copyRandomBinaryTree(root)
        
        let result = TreeNodeRandom.serialize(clone)
        
        XCTAssertEqual(result, data)
    }
    
    func test_D() {
        let data = [[Int?]?]()
        
        let root = TreeNodeRandom.deserialize(data)
        
        let clone = CloneBinaryTreeWithRandomPointer.copyRandomBinaryTree(root)
        
        let result = TreeNodeRandom.serialize(clone)
        
        XCTAssertEqual(result, data)
    }
    
    func test_E() {
        let data = [[1, nil], nil, [2, nil], nil, [1, nil]]
        
        let root = TreeNodeRandom.deserialize(data)
        
        let clone = CloneBinaryTreeWithRandomPointer.copyRandomBinaryTree(root)
        
        let result = TreeNodeRandom.serialize(clone)
        
        XCTAssertEqual(result, data)
    }
}
