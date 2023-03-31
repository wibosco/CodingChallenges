//
//  ConvertSortedArrayToBinarySearchTreeTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 29/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class ConvertSortedArrayToBinarySearchTreeTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [-10, -3, 0, 5, 9]
        
        let root = ConvertSortedArrayToBinarySearchTree.sortedArrayToBST(nums)
        
        let values = BinaryTreeNode.serialize(root)
        
        XCTAssertEqual(values, [0, -3, 9, -10, nil, 5])
    }
    
    func test_B() {
        let nums = [1, 3]
        
        let root = ConvertSortedArrayToBinarySearchTree.sortedArrayToBST(nums)
        
        let values = BinaryTreeNode.serialize(root)
        
        XCTAssertEqual(values, [3, 1])
    }
}
