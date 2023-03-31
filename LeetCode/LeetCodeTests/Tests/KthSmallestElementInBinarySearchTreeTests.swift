//
//  KthSmallestElementInBinarySearchTreeTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 28/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class KthSmallestElementInBinarySearchTreeTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [3, 1, 4, nil, 2]
        let root = BinaryTreeNode.deserialize(data)
        let k = 1
        
        let kthSmallest = KthSmallestElementInBinarySearchTree.kthSmallest(root, k)
        
        XCTAssertEqual(kthSmallest, 1)
    }
    
    func test_B() {
        let data = [5, 3, 6, 2, 4, nil, nil, 1]
        let root = BinaryTreeNode.deserialize(data)
        let k = 3
        
        let kthSmallest = KthSmallestElementInBinarySearchTree.kthSmallest(root, k)
        
        XCTAssertEqual(kthSmallest, 3)
    }
}
