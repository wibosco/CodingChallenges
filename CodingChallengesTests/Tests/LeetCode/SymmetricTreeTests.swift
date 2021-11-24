//
//  SymmetricTreeTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 23/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class SymmetricTreeTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [1, 2, 2, 3, 4, 4, 3]
        
        let root = TreeNode.createBinaryTree(fromLevelOrderArray: data)
        
        let isSymmetric = SymmetricTree.isSymmetric(root)
        
        XCTAssertTrue(isSymmetric)
    }
    
    func test_B() {
        let data = [1, 2, 2, nil, 3, nil, 3]
        
        let root = TreeNode.createBinaryTree(fromLevelOrderArray: data)
        
        let isSymmetric = SymmetricTree.isSymmetric(root)
        
        XCTAssertFalse(isSymmetric)
    }
    
    func test_C() {
        let data = [1]
        
        let root = TreeNode.createBinaryTree(fromLevelOrderArray: data)
        
        let isSymmetric = SymmetricTree.isSymmetric(root)
        
        XCTAssertTrue(isSymmetric)
    }
    
    func test_D() {
        let data = [2, 3, 3, 4, 5, 5, 4, nil, nil, 8, 9, nil, nil, 9, 8]
        
        let root = TreeNode.createBinaryTree(fromLevelOrderArray: data)
        
        let isSymmetric = SymmetricTree.isSymmetric(root)
        
        XCTAssertFalse(isSymmetric)
    }
}
