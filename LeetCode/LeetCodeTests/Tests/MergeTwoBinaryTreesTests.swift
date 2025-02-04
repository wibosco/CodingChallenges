//
//  MergeTwoBinaryTreesTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 11/04/2022.
//

import XCTest

@testable import LeetCode

final class MergeTwoBinaryTreesTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data1 = [1, 3, 2, 5]
        let data2 = [2, 1, 3, nil, 4, nil, 7]
        
        let tree1 = TreeNode.deserialize(data1)
        let tree2 = TreeNode.deserialize(data2)
        
        let mergedTree = MergeTwoBinaryTrees().mergeTrees(tree1, tree2)
        
        let result = TreeNode.serialize(mergedTree)
        
        XCTAssertEqual(result, [3, 4, 5, 5, 4, nil, 7])
    }
    
    func test_B() {
        let data1 = [1]
        let data2 = [1, 2]
        
        let tree1 = TreeNode.deserialize(data1)
        let tree2 = TreeNode.deserialize(data2)
        
        let mergedTree = MergeTwoBinaryTrees().mergeTrees(tree1, tree2)
        
        let result = TreeNode.serialize(mergedTree)
        
        XCTAssertEqual(result, [2, 2])
    }
}
