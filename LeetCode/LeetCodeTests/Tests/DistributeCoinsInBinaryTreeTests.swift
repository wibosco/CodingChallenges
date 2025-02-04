//
//  DistributeCoinsInBinaryTreeTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 16/11/2023.
//

import XCTest

@testable import LeetCode

final class DistributeCoinsInBinaryTreeTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [3,0,0]
        let root = TreeNode.deserialize(data)
        
        let result = DistributeCoinsInBinaryTree().distributeCoins(root)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_B() {
        let data = [0,3,0]
        let root = TreeNode.deserialize(data)
        
        let result = DistributeCoinsInBinaryTree().distributeCoins(root)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_C() {
        let data = [7,0,0,0,0,0,0]
        let root = TreeNode.deserialize(data)
        
        let result = DistributeCoinsInBinaryTree().distributeCoins(root)
        
        XCTAssertEqual(result, 10)
    }
}
