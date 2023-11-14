//
//  UnivaluedBinaryTreeTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 10/11/2023.
//

import XCTest

@testable import LeetCode

final class UnivaluedBinaryTreeTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [1,1,1,1,1,nil,1]
        let root = TreeNode.deserialize(data)
        
        let result = UnivaluedBinaryTree.isUnivalTree(root)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let data = [2,2,2,5,2]
        let root = TreeNode.deserialize(data)
        
        let result = UnivaluedBinaryTree.isUnivalTree(root)
        
        XCTAssertFalse(result)
    }
}
