//
//  LongestZigZagPathInABinaryTreeTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 17/11/2023.
//

import XCTest

@testable import LeetCode

final class LongestZigZagPathInABinaryTreeTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [1,nil,1,1,1,nil,nil,1,1,nil,1,nil,nil,nil,1]
        let root = TreeNode.deserialize(data)
        
        let result = LongestZigZagPathInABinaryTree.longestZigZag(root)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_B() {
        let data = [1,1,1,nil,1,nil,nil,1,1,nil,1]
        let root = TreeNode.deserialize(data)
        
        let result = LongestZigZagPathInABinaryTree.longestZigZag(root)
        
        XCTAssertEqual(result, 4)
    }
    
    func test_C() {
        let data = [1]
        let root = TreeNode.deserialize(data)
        
        let result = LongestZigZagPathInABinaryTree.longestZigZag(root)
        
        XCTAssertEqual(result, 0)
    }
}
