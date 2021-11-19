//
//  ClosestBinarySearchTreeValueTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 19/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class ClosestBinarySearchTreeValueTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let target = 3.714286
        let root = TreeNode.createTree(fromBFSArray: [4, 2, 5, 1, 3])
        
        let closet = ClosestBinarySearchTreeValue.closestValue(root, target)
        
        XCTAssertEqual(closet, 4)
    }
    
    func test_B() {
        let target = 4.428571
        let root = TreeNode.createTree(fromBFSArray: [1])
        
        let closet = ClosestBinarySearchTreeValue.closestValue(root, target)
        
        XCTAssertEqual(closet, 1)
    }
    
    func test_C() {
        let target = 3.428571
        let root = TreeNode.createTree(fromBFSArray: [1, nil, 3])
        
        let closet = ClosestBinarySearchTreeValue.closestValue(root, target)
        
        XCTAssertEqual(closet, 3)
    }
}
