//
//  CousinsInBinaryTreeTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 10/11/2023.
//

import XCTest

@testable import LeetCode

final class CousinsInBinaryTreeTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let x = 4
        let y = 3
        let data = [1,2,3,4]
        let root = BinaryTreeNode.deserialize(data)
        
        let result = CousinsInBinaryTree.isCousins(root, x, y)
        
        XCTAssertFalse(result)
    }
    
    func test_B() {
        let x = 5
        let y = 4
        let data = [1,2,3,nil,4,nil,5]
        let root = BinaryTreeNode.deserialize(data)
        
        let result = CousinsInBinaryTree.isCousins(root, x, y)
        
        XCTAssertTrue(result)
    }
    
    func test_C() {
        let x = 2
        let y = 3
        let data = [1,2,3,nil,4]
        let root = BinaryTreeNode.deserialize(data)
        
        let result = CousinsInBinaryTree.isCousins(root, x, y)
        
        XCTAssertFalse(result)
    }
}
