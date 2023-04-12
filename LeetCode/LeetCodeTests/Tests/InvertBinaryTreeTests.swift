//
//  InvertBinaryTreeTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 12/04/2023.
//

import XCTest

@testable import LeetCode

final class InvertBinaryTreeTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [4, 2, 7, 1, 3, 6, 9]
        
        let root = BinaryTreeNode.deserialize(data)
        
        let result = InvertBinaryTree.invertTree(root)
        let value = BinaryTreeNode.serialize(root)
        
        XCTAssertEqual(value, [4, 7, 2, 9, 6, 3, 1])
    }
    
    func test_B() {
        let data = [2, 1, 3]
        
        let root = BinaryTreeNode.deserialize(data)
        
        let result = InvertBinaryTree.invertTree(root)
        let value = BinaryTreeNode.serialize(root)
        
        XCTAssertEqual(value, [2, 3, 1])
    }
    
    func test_C() {
        let data = [Int]()
        
        let root = BinaryTreeNode.deserialize(data)
        
        let result = InvertBinaryTree.invertTree(root)
        let value = BinaryTreeNode.serialize(root)
        
        XCTAssertEqual(value, [])
    }
}
