//
//  AABinaryTreeLongestConsecutiveSequenceIITests.swift
//  LeetCodeTests
//
//  Created by William Boles on 21/11/2023.
//

import XCTest

@testable import LeetCode

final class AABinaryTreeLongestConsecutiveSequenceIITests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [1,2,3]
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreeLongestConsecutiveSequenceII.longestConsecutive(root)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_B() {
        let data = [2,1,3]
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreeLongestConsecutiveSequenceII.longestConsecutive(root)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_C() {
        let data = [1,1,1]
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreeLongestConsecutiveSequenceII.longestConsecutive(root)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_D() {
        let data = [1,nil,2]
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreeLongestConsecutiveSequenceII.longestConsecutive(root)
        
        XCTAssertEqual(result, 2)
    }
        
    func test_E() {
        let data = [2,nil,3,4,nil,1]
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreeLongestConsecutiveSequenceII.longestConsecutive(root)
        
        XCTAssertEqual(result, 3)
    }
}
