//
//  MinimumDistanceBetweenBSTNodesTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 10/11/2023.
//

import XCTest

@testable import LeetCode

final class MinimumDistanceBetweenBSTNodesTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [4,2,6,1,3]
        let root = BinaryTreeNode.deserialize(data)
        
        let result = MinimumDistanceBetweenBSTNodes.minDiffInBST(root)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_B() {
        let data = [1,0,48,nil,nil,12,49]
        let root = BinaryTreeNode.deserialize(data)
        
        let result = MinimumDistanceBetweenBSTNodes.minDiffInBST(root)
        
        XCTAssertEqual(result, 1)
    }
}
