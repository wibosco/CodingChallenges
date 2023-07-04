//
//  TrimABinarySearchTreeTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 15/04/2022.
//

import XCTest

@testable import LeetCode

final class TrimABinarySearchTreeTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [1, 0, 2]
        let tree = BinaryTreeNode.deserialize(data)
        
        let low = 1
        let high = 2
        
        let result = TrimABinarySearchTree.trimBST(tree, low, high)
        
        let values = BinaryTreeNode.serialize(result)
        
        XCTAssertEqual(values, [1, nil, 2])
    }
    
    func test_B() {
        let data = [3, 0, 4, nil, 2, nil, nil, 1]
        let tree = BinaryTreeNode.deserialize(data)
        
        let low = 1
        let high = 3
        
        let result = TrimABinarySearchTree.trimBST(tree, low, high)
        
        let values = BinaryTreeNode.serialize(result)
        
        XCTAssertEqual(values, [3, 2, nil, 1])
    }
    
    func test_C() {
        let data = [3, 1, 4, nil, 2]
        let tree = BinaryTreeNode.deserialize(data)
        
        let low = 3
        let high = 4
        
        let result = TrimABinarySearchTree.trimBST(tree, low, high)
        
        let values = BinaryTreeNode.serialize(result)
        
        XCTAssertEqual(values, [3, nil, 4 ])
    }
}
