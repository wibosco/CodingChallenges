//
//  SearchInABinarySearchTreeTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 19/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class SearchInABinarySearchTreeTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [4, 2, 7, 1, 3]
        let root = BinaryTreeNode.deserialize(data)
        let val = 2
        
        let node = SearchInABinarySearchTree.searchBST(root, val)
        
        let values = BinaryTreeNode.serialize(node)
        
        XCTAssertEqual(values, [2, 1, 3])
    }
    
    func test_B() {
        let data = [4, 2, 7, 1, 3]
        let root = BinaryTreeNode.deserialize(data)
        let val = 5
        
        let node = SearchInABinarySearchTree.searchBST(root, val)
        
        let values = BinaryTreeNode.serialize(node)
        
        XCTAssertEqual(values, [Int]())
    }

}
