//
//  DiameterOfBinaryTreeTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 09/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class DiameterOfBinaryTreeTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [1, 2, 3, 4, 5]
        
        let root = BinaryTreeNode.createBinaryTree(fromLevelOrderArray: data)
        
        let diameter = DiameterOfBinaryTree.diameterOfBinaryTree(root)
        
        XCTAssertEqual(diameter, 3)
    }
    
    func test_Bs() {
        let data = [1, 2]
        
        let root = BinaryTreeNode.createBinaryTree(fromLevelOrderArray: data)
        
        let diameter = DiameterOfBinaryTree.diameterOfBinaryTree(root)
        
        XCTAssertEqual(diameter, 1)
    }

}