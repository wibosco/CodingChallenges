//
//  EvaluateBooleanBinaryTreeTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 10/11/2023.
//

import XCTest

@testable import LeetCode

final class EvaluateBooleanBinaryTreeTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [2,1,3,nil,nil,0,1]
        let root = BinaryTreeNode.deserialize(data)
        
        let result = EvaluateBooleanBinaryTree.evaluateTree(root)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let data = [0]
        let root = BinaryTreeNode.deserialize(data)
        
        let result = EvaluateBooleanBinaryTree.evaluateTree(root)
        
        XCTAssertFalse(result)
    }
}
