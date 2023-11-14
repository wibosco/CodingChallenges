//
//  BalancedBinaryTreeTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 08/05/2023.
//

import XCTest

@testable import LeetCode

final class BalancedBinaryTreeTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [3, 9, 20, nil, nil, 15, 7]
        let root = TreeNode.deserialize(data)
            
        let result = BalancedBinaryTree.isBalanced(root)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let data = [1, 2, 2, 3, 3, nil, nil, 4, 4]
        let root = TreeNode.deserialize(data)
            
        let result = BalancedBinaryTree.isBalanced(root)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let result = BalancedBinaryTree.isBalanced(nil)
        
        XCTAssertTrue(result)
    }
    
    func test_D() {
        let data = [1, 2, 2, 3, nil, nil, 3, 4, nil, nil, 4]
        let root = TreeNode.deserialize(data)
        
        let result = BalancedBinaryTree.isBalanced(root)
        
        XCTAssertFalse(result)
    }
}
