//
//  ValidateBSTTests.swift
//  CodingChallenges
//
//  Created by William Boles on 02/07/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import CrackingTheCodingInterview

class ValidateBSTTests: XCTestCase {
    
    // MARK: InOrder
    
    func test_A() {
        let relationships = [[2, 4],
                             [1, 2],
                             [3, 6],
                             [1, 3],
                             [2, 5]]
        
        let root = TreeNodeCtCI.createBinaryTree(fromRelationships: relationships)
        let isBST = ValidateBST.isValidBST(root: root)
        
        XCTAssertFalse(isBST)
    }
    
    func test_B() {
        let relationships = [[5, 2],
                             [5, 7],
                             [2, 1],
                             [2, 3],
                             [7, 6],
                             [7, 8]]
        
        let root = TreeNodeCtCI.createBinaryTree(fromRelationships: relationships)
        let isBST = ValidateBST.isValidBST(root: root)
        
        XCTAssertTrue(isBST)
    }
    
    func test_C() {
        let relationships = [[5, 2],
                             [5, 7],
                             [2, 1],
                             [2, 9],
                             [7, 6],
                             [7, 8]]
        
        let root = TreeNodeCtCI.createBinaryTree(fromRelationships: relationships)
        let isBST = ValidateBST.isValidBST(root: root)
        
        XCTAssertFalse(isBST)
    }
    
    func test_D() {
        let relationships = [[5, 2],
                             [5, 7],
                             [2, 1],
                             [2, 3],
                             [7, 6],
                             [7, 8],
                             [8, 12],
                             [12, 9],
                             [9, 10]]
        
        let root = TreeNodeCtCI.createBinaryTree(fromRelationships: relationships)
        let isBST = ValidateBST.isValidBST(root: root)
        
        XCTAssertFalse(isBST)
    }
    
    func test_E() {
        let relationships = [[5, 2],
                             [5, 7],
                             [2, 1],
                             [2, 3],
                             [7, 6],
                             [7, 8],
                             [8, 12],
                             [12, 9],
                             [9, 10],
                             [9, 11]]
        
        let root = TreeNodeCtCI.createBinaryTree(fromRelationships: relationships)
        let isBST = ValidateBST.isValidBST(root: root)
        
        XCTAssertFalse(isBST)
    }
    
    func test_F() {
        let relationships = [[5, 2],
                             [5, 12],
                             [2, 1],
                             [2, 3],
                             [12, 10],
                             [12, 14],
                             [14, 13],
                             [10, 8],
                             [10, 11]]
        
        let root = TreeNodeCtCI.createBinaryTree(fromRelationships: relationships)
        let isBST = ValidateBST.isValidBST(root: root)
        
        XCTAssertTrue(isBST)
    }
}
