//
//  LowestCommonAncestorBinaryTreeIIITests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 16/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class LowestCommonAncestorBinaryTreeIIITests: XCTestCase {

    // MARK: - Tests
    
    // MARK: - Tests
    
    func test_A() {
        let data = [3, 5, 1, 6, 2, 0, 8, nil, nil, 7, 4]
        
        let (p, q) = BinaryTreeNodeParent.deserialize(data, 5, 1)
        
        let lca = LowestCommonAncestorBinaryTreeIII.lowestCommonAncestor(p, q)
        
        XCTAssertEqual(lca?.val, 3)
    }
    
    func test_B() {
        let data = [3, 5, 1, 6, 2, 0, 8, nil, nil, 7, 4]
        
        let (p, q) = BinaryTreeNodeParent.deserialize(data, 5, 4)
        
        let lca = LowestCommonAncestorBinaryTreeIII.lowestCommonAncestor(p, q)
        
        XCTAssertEqual(lca?.val, 5)
    }
    
    func test_C() {
        let data = [1, 2]
        
        let (p, q) = BinaryTreeNodeParent.deserialize(data, 1, 2)
        
        let lca = LowestCommonAncestorBinaryTreeIII.lowestCommonAncestor(p, q)
        
        XCTAssertEqual(lca?.val, 1)
    }
}
