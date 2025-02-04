//
//  FindModeInBinarySearchTreeTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 09/11/2023.
//

import XCTest

@testable import LeetCode

final class FindModeInBinarySearchTreeTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [1,nil,2,2]
        let root = TreeNode.deserialize(data)
        
        let result = FindModeInBinarySearchTree().findMode(root)
        
        XCTAssertEqual(result, [2])
    }
    
    func test_B() {
        let data = [0]
        let root = TreeNode.deserialize(data)
        
        let result = FindModeInBinarySearchTree().findMode(root)
        
        XCTAssertEqual(result, [0])
    }
    
    func test_C() {
        let data = [1,nil,2]
        let root = TreeNode.deserialize(data)
        
        let result = FindModeInBinarySearchTree().findMode(root)
        
        XCTAssertEqual(result, [1, 2])
    }
}
