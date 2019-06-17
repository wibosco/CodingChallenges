//
//  ValidateBSTTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 02/07/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class ValidateBSTTests: XCTestCase {
    
    // MARK: InOrder
    
    func test_validateInOrderBSTA() {
        let relationships = [[2, 4],
                             [1, 2],
                             [3, 6],
                             [1, 3],
                             [2, 5]]
        
        let root = ValidateBSTFactory.buildBinaryTree(relationships: relationships)
        let isBST = ValidateBST.inOrderTraversalIsBST(root: root)
        
        XCTAssertFalse(isBST)
    }
    
    func test_validateInOrderBSTB() {
        let relationships = [[5, 2],
                             [5, 7],
                             [2, 1],
                             [2, 3],
                             [7, 6],
                             [7, 8]]
        
        let root = ValidateBSTFactory.buildBinaryTree(relationships: relationships)
        let isBST = ValidateBST.inOrderTraversalIsBST(root: root)
        
        XCTAssertTrue(isBST)
    }
    
    func test_validateInOrderBSTC() {
        let relationships = [[5, 2],
                             [5, 7],
                             [2, 1],
                             [2, 9],
                             [7, 6],
                             [7, 8]]
        
        let root = ValidateBSTFactory.buildBinaryTree(relationships: relationships)
        let isBST = ValidateBST.inOrderTraversalIsBST(root: root)
        
        XCTAssertFalse(isBST)
    }
    
    func test_validateInOrderBSTD() {
        let relationships = [[5, 2],
                             [5, 7],
                             [2, 1],
                             [2, 3],
                             [7, 6],
                             [7, 8],
                             [8, 12],
                             [12, 9],
                             [9, 10]]
        
        let root = ValidateBSTFactory.buildBinaryTree(relationships: relationships)
        let isBST = ValidateBST.inOrderTraversalIsBST(root: root)
        
        XCTAssertFalse(isBST)
    }
    
    func test_validateInOrderBSTE() {
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
        
        let root = ValidateBSTFactory.buildBinaryTree(relationships: relationships)
        let isBST = ValidateBST.inOrderTraversalIsBST(root: root)
        
        XCTAssertFalse(isBST)
    }
    
    func test_validateInOrderBSTF() {
        let relationships = [[5, 2],
                             [5, 12],
                             [2, 1],
                             [2, 3],
                             [12, 10],
                             [12, 14],
                             [14, 13],
                             [10, 8],
                             [10, 11]]
        
        let root = ValidateBSTFactory.buildBinaryTree(relationships: relationships)
        let isBST = ValidateBST.inOrderTraversalIsBST(root: root)
        
        XCTAssertTrue(isBST)
    }
    
    //MARK: MinMax
    
    func test_validateMinMaxBSTA() {
        let relationships = [[2, 4],
                             [1, 2],
                             [3, 6],
                             [1, 3],
                             [2, 5]]
        
        let root = ValidateBSTFactory.buildBinaryTree(relationships: relationships)
        let isBST = ValidateBST.maxMinIsBST(root: root)
        
        XCTAssertFalse(isBST)
    }
    
    func test_validateMinMaxBSTB() {
        let relationships = [[5, 2],
                             [5, 7],
                             [2, 1],
                             [2, 3],
                             [7, 6],
                             [7, 8]]
        
        let root = ValidateBSTFactory.buildBinaryTree(relationships: relationships)
        let isBST = ValidateBST.maxMinIsBST(root: root)
        
        XCTAssertTrue(isBST)
    }
    
    func test_validateMinMaxBSTC() {
        let relationships = [[5, 2],
                             [5, 7],
                             [2, 1],
                             [2, 9],
                             [7, 6],
                             [7, 8]]
        
        let root = ValidateBSTFactory.buildBinaryTree(relationships: relationships)
        let isBST = ValidateBST.maxMinIsBST(root: root)
        
        XCTAssertFalse(isBST)
    }
    
    func test_validateMinMaxBSTD() {
        let relationships = [[5, 2],
                             [5, 7],
                             [2, 1],
                             [2, 3],
                             [7, 6],
                             [7, 8],
                             [8, 12],
                             [12, 9],
                             [9, 10]]
        
        let root = ValidateBSTFactory.buildBinaryTree(relationships: relationships)
        let isBST = ValidateBST.maxMinIsBST(root: root)
        
        XCTAssertFalse(isBST)
    }
    
    func test_validateMinMaxBSTE() {
        let relationships = [[5, 2],
                             [5, 7],
                             [2, 1],
                             [2, 3],
                             [7, 6],
                             [7, 8],
                             [8, 12],
                             [12, 9],
                             [9, 10]]
        
        let root = ValidateBSTFactory.buildBinaryTree(relationships: relationships)
        let isBST = ValidateBST.maxMinIsBST(root: root)
        
        XCTAssertFalse(isBST)
    }
    
    func test_validateMinMaxBSTF() {
        let relationships = [[5, 2],
                             [5, 12],
                             [2, 1],
                             [2, 3],
                             [12, 10],
                             [12, 14],
                             [14, 13],
                             [10, 8],
                             [10, 11]]
        
        let root = ValidateBSTFactory.buildBinaryTree(relationships: relationships)
        let isBST = ValidateBST.maxMinIsBST(root: root)
        
        XCTAssertTrue(isBST)
    }
}
