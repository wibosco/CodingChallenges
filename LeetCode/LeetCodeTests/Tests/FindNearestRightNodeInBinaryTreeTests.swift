//
//  FindNearestRightNodeInBinaryTreeTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 24/11/2023.
//

import XCTest

@testable import LeetCode

final class FindNearestRightNodeInBinaryTreeTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let u = TreeNode(4)
        let data = [1,2,3,nil,4,5,6]
        let root = TreeNode.deserialize(data)
        
        let result = FindNearestRightNodeInBinaryTree().findNearestRightNode(root, u)
        
        XCTAssertEqual(result?.val, 5)
    }
    
    func test_B() {
        let u = TreeNode(2)
        let data = [3,nil,4,2]
        let root = TreeNode.deserialize(data)
        
        let result = FindNearestRightNodeInBinaryTree().findNearestRightNode(root, u)
        
        XCTAssertNil(result)
    }
}
