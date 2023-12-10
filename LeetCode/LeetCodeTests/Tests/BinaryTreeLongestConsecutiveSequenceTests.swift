//
//  BinaryTreeLongestConsecutiveSequenceTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 09/12/2023.
//

import XCTest

@testable import LeetCode

final class BinaryTreeLongestConsecutiveSequenceTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [1,nil,3,2,4,nil,nil,nil,5]
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreeLongestConsecutiveSequence.longestConsecutive(root)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_B() {
        let data = [2,nil,3,2,nil,1]
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreeLongestConsecutiveSequence.longestConsecutive(root)
        
        XCTAssertEqual(result, 2)
    }
}
