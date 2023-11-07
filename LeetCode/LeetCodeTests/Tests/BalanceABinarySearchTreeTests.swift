//
//  BalanceABinarySearchTreeTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 07/11/2023.
//

import XCTest

@testable import LeetCode

final class BalanceABinarySearchTreeTests: XCTestCase {
    
    //MARK: - Tests
    
    func test_A() {
        let data = [1,nil,2,nil,3,nil,4,nil,nil]
        let root = BinaryTreeNode.deserialize(data)
        
        let result = BalanceABinarySearchTree.balanceBST(root)
        
        let values = BinaryTreeNode.serialize(result)
        
        XCTAssertEqual(values, [2,1,3,nil,nil,nil,4])
    }
    
    func test_B() {
        let data = [2,1,3]
        let root = BinaryTreeNode.deserialize(data)
        
        let result = BalanceABinarySearchTree.balanceBST(root)
        
        let values = BinaryTreeNode.serialize(result)
        
        XCTAssertEqual(values, [2,1,3])
    }
}
