//
//  ConstructBinaryTreeFromStringTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 01/04/2022.
//

import XCTest

@testable import LeetCode

class ConstructBinaryTreeFromStringTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let s = "4(2(3)(1))(6(5))"
        
        let root = ConstructBinaryTreeFromString.str2tree(s)
        
        let array = BinaryTreeNode.serialize(root)
        
        XCTAssertEqual(array, [4, 2, 6, 3, 1, 5])
    }
    
    func test_B() {
        let s = "4(2(3)(1))(6(5)(7))"
        
        let root = ConstructBinaryTreeFromString.str2tree(s)
        
        let array = BinaryTreeNode.serialize(root)
        
        XCTAssertEqual(array, [4, 2, 6, 3, 1, 5, 7])
    }
    
    func test_C() {
        let s = "-4(2(3)(1))(6(5)(7))"
        
        let root = ConstructBinaryTreeFromString.str2tree(s)
        
        let array = BinaryTreeNode.serialize(root)
        
        XCTAssertEqual(array, [-4, 2, 6, 3, 1, 5, 7])
    }
}
