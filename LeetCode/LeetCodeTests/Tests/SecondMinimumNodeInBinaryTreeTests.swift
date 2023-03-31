//
//  SecondMinimumNodeInBinaryTreeTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 28/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class SecondMinimumNodeInBinaryTreeTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [2, 2, 5, nil, nil, 5, 7]
        let root = BinaryTreeNode.deserialize(data)
        
        let secondMin = SecondMinimumNodeInBinaryTree.findSecondMinimumValue(root)
        
        XCTAssertEqual(secondMin, 5)
    }
    
    func test_B() {
        let data = [2, 2, 2]
        let root = BinaryTreeNode.deserialize(data)
        
        let secondMin = SecondMinimumNodeInBinaryTree.findSecondMinimumValue(root)
        
        XCTAssertEqual(secondMin, -1)
    }
}
