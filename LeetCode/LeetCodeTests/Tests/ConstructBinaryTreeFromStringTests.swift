//
//  ConstructBinaryTreeFromStringTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 01/04/2022.
//

import XCTest

@testable import LeetCode

final class ConstructBinaryTreeFromStringTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let s = "4(2(3)(1))(6(5))"
        
        let root = ConstructBinaryTreeFromString().str2tree(s)
        
        let result = TreeNode.serialize(root)
        
        XCTAssertEqual(result, [4, 2, 6, 3, 1, 5])
    }
    
    func test_B() {
        let s = "4(2(3)(1))(6(5)(7))"
        
        let root = ConstructBinaryTreeFromString().str2tree(s)
        
        let result = TreeNode.serialize(root)
        
        XCTAssertEqual(result, [4, 2, 6, 3, 1, 5, 7])
    }
    
    func test_C() {
        let s = "-4(2(3)(1))(6(5)(7))"
        
        let root = ConstructBinaryTreeFromString().str2tree(s)
        
        let result = TreeNode.serialize(root)
        
        XCTAssertEqual(result, [-4, 2, 6, 3, 1, 5, 7])
    }
}
