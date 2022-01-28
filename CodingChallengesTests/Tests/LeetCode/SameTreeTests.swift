//
//  SameTreeTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 28/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class SameTreeTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let p = [1, 2, 3]
        let q = [1, 2, 3]
        
        let pRoot = BinaryTreeNode.deserialize(p)
        let qRoot = BinaryTreeNode.deserialize(q)
        
        let same = SameTree.isSameTree(pRoot, qRoot)
        
        XCTAssertTrue(same)
    }
    
    func test_B() {
        let p = [1, 2]
        let q = [1, nil, 2]
        
        let pRoot = BinaryTreeNode.deserialize(p)
        let qRoot = BinaryTreeNode.deserialize(q)
        
        let same = SameTree.isSameTree(pRoot, qRoot)
        
        XCTAssertFalse(same)
    }
    
    func test_C() {
        let p = [1, 2, 1]
        let q = [1, 1, 2]
        
        let pRoot = BinaryTreeNode.deserialize(p)
        let qRoot = BinaryTreeNode.deserialize(q)
        
        let same = SameTree.isSameTree(pRoot, qRoot)
        
        XCTAssertFalse(same)
    }
}
