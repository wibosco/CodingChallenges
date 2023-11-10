//
//  LeafSimilarTreesTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 10/11/2023.
//

import XCTest

@testable import LeetCode

final class LeafSimilarTreesTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data1 = [3,5,1,6,2,9,8,nil,nil,7,4]
        let data2 = [3,5,1,6,7,4,2,nil,nil,nil,nil,nil,nil,9,8]
        
        let root1 = BinaryTreeNode.deserialize(data1)
        let root2 = BinaryTreeNode.deserialize(data2)
        
        let result = LeafSimilarTrees.leafSimilar(root1, root2)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let data1 = [1,2,3]
        let data2 = [1,3,2]
        
        let root1 = BinaryTreeNode.deserialize(data1)
        let root2 = BinaryTreeNode.deserialize(data2)
        
        let result = LeafSimilarTrees.leafSimilar(root1, root2)
        
        XCTAssertFalse(result)
    }
}
