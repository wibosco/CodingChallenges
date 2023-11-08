//
//  CountCompleteTreeNodesTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 08/11/2023.
//

import XCTest

@testable import LeetCode

final class CountCompleteTreeNodesTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [1,2,3,4,5,6]
        let root = BinaryTreeNode.deserialize(data)
        
        let result = CountCompleteTreeNodes.countNodes(root)
        
        XCTAssertEqual(result, 6)
    }
    
    func test_B() {
        let data = [Int]()
        let root = BinaryTreeNode.deserialize(data)
        
        let result = CountCompleteTreeNodes.countNodes(root)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_C() {
        let data = [1]
        let root = BinaryTreeNode.deserialize(data)
        
        let result = CountCompleteTreeNodes.countNodes(root)
        
        XCTAssertEqual(result, 1)
    }
}
