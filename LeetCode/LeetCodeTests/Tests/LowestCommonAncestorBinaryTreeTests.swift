//
//  LowestCommonAncestorBinaryTreeTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 27/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class LowestCommonAncestorBinaryTreeTests: XCTestCase {

    // MARK: - Tests
     
     func test_A() {
         let data = [3, 5, 1, 6, 2, 0, 8, nil, nil, 7, 4]
         
         let root = BinaryTreeNode.deserialize(data)
         let p = BinaryTreeNode(5)
         let q = BinaryTreeNode(1)
         
         let result = LowestCommonAncestorBinaryTree.lowestCommonAncestor(root, p, q)
         
         XCTAssertEqual(result?.val, 3)
     }
    
    func test_B() {
        let data = [3, 5, 1, 6, 2, 0, 8, nil, nil, 7, 4]
        
        let root = BinaryTreeNode.deserialize(data)
        let p = BinaryTreeNode(5)
        let q = BinaryTreeNode(4)
        
        let result = LowestCommonAncestorBinaryTree.lowestCommonAncestor(root, p, q)
        
        XCTAssertEqual(result?.val, 5)
    }
    
    func test_C() {
        let data = [1, 2]
        
        let root = BinaryTreeNode.deserialize(data)
        let p = BinaryTreeNode(1)
        let q = BinaryTreeNode(2)
        
        let result = LowestCommonAncestorBinaryTree.lowestCommonAncestor(root, p, q)
        
        XCTAssertEqual(result?.val, 1)
    }
}
