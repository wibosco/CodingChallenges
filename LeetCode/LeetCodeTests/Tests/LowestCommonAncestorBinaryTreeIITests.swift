//
//  LowestCommonAncestorBinaryTreeIITests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 16/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class LowestCommonAncestorBinaryTreeIITests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [3, 5, 1, 6, 2, 0, 8, nil, nil, 7, 4]
        
        let root = BinaryTreeNode.deserialize(data)
        let p = BinaryTreeNode(5)
        let q = BinaryTreeNode(1)
        
        let lca = LowestCommonAncestorBinaryTreeII.lowestCommonAncestor(root, p, q)
        
        XCTAssertEqual(lca?.val, 3)
    }
    
    func test_B() {
        let data = [3, 5, 1, 6, 2, 0, 8, nil, nil, 7, 4]
        
        let root = BinaryTreeNode.deserialize(data)
        let p = BinaryTreeNode(5)
        let q = BinaryTreeNode(4)
        
        let lca = LowestCommonAncestorBinaryTreeII.lowestCommonAncestor(root, p, q)
        
        XCTAssertEqual(lca?.val, 5)
    }
    
    func test_C() {
        let data = [3, 5, 1, 6, 2, 0, 8, nil, nil, 7, 4]
        
        let root = BinaryTreeNode.deserialize(data)
        let p = BinaryTreeNode(5)
        let q = BinaryTreeNode(10)
        
        let lca = LowestCommonAncestorBinaryTreeII.lowestCommonAncestor(root, p, q)
        
        XCTAssertNil(lca)
    }
}
