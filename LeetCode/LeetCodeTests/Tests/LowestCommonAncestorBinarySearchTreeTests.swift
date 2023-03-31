//
//  LowestCommonAncestorBinarySearchTreeTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 16/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class LowestCommonAncestorBinarySearchTreeTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [6, 2, 8, 0, 4, 7, 9, nil, nil, 3, 5]
        
        let root = BinaryTreeNode.deserialize(data)
        let p = BinaryTreeNode(2)
        let q = BinaryTreeNode(8)
        
        let lca = LowestCommonAncestorBinaryTree.lowestCommonAncestor(root, p, q)
        
        XCTAssertEqual(lca?.val, 6)
    }
    
    func test_B() {
        let data = [6, 2, 8, 0, 4, 7, 9, nil, nil, 3, 5]
        
        let root = BinaryTreeNode.deserialize(data)
        let p = BinaryTreeNode(2)
        let q = BinaryTreeNode(4)
        
        let lca = LowestCommonAncestorBinaryTree.lowestCommonAncestor(root, p, q)
        
        XCTAssertEqual(lca?.val, 2)
    }
    
    func test_C() {
        let data = [2, 1]
        
        let root = BinaryTreeNode.deserialize(data)
        let p = BinaryTreeNode(2)
        let q = BinaryTreeNode(1)
        
        let lca = LowestCommonAncestorBinaryTree.lowestCommonAncestor(root, p, q)
        
        XCTAssertEqual(lca?.val, 2)
    }
}
