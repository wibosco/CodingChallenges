//
//  ValidateBinarySearchTreeTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 22/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class ValidateBinarySearchTreeTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [2, 1, 3]
        
        let root = BinaryTreeNode.deserialize(data)
        
        let isValid = ValidateBinarySearchTree.isValidBST(root)
        
        XCTAssertTrue(isValid)
    }
    
    func test_B() {
        let data = [5, 1, 4, nil, nil, 3, 6]
        
        let root = BinaryTreeNode.deserialize(data)
        
        let isValid = ValidateBinarySearchTree.isValidBST(root)
        
        XCTAssertFalse(isValid)
    }
    
    func test_C() {
        let data = [2, 2, 2]
        
        let root = BinaryTreeNode.deserialize(data)
        
        let isValid = ValidateBinarySearchTree.isValidBST(root)
        
        XCTAssertFalse(isValid)
    }
}
