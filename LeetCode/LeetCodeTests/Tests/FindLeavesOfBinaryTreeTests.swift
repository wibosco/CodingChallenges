//
//  FindLeavesOfBinaryTreeTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 05/08/2022.
//

import XCTest

@testable import LeetCode

final class FindLeavesOfBinaryTreeTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [1, 2, 3, 4, 5]
        
        let root = TreeNode.deserialize(data)
        
        let result = FindLeavesOfBinaryTree().findLeaves(root)
        
        XCTAssertEqual(result, [[4, 5, 3], [2], [1]])
    }
    
    func test_B() {
        let data = [1]
        
        let root = TreeNode.deserialize(data)
        
        let result = FindLeavesOfBinaryTree().findLeaves(root)
        
        XCTAssertEqual(result, [[1]])
    }
}
