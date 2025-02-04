//
//  BoundaryOfBinaryTreeTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 20/11/2023.
//

import XCTest

@testable import LeetCode

final class BoundaryOfBinaryTreeTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [1,nil,2,3,4]
        let root = TreeNode.deserialize(data)
        
        let result = BoundaryOfBinaryTree().boundaryOfBinaryTree(root)
        
        XCTAssertEqual(result, [1,3,4,2])
    }
    
    func test_B() {
        let data = [1,2,3,4,5,6,nil,nil,nil,7,8,9,10]
        let root = TreeNode.deserialize(data)
        
        let result = BoundaryOfBinaryTree().boundaryOfBinaryTree(root)
        
        XCTAssertEqual(result, [1,2,4,7,8,9,10,6,3])
    }
    
    func test_C() {
        let data = [1,nil,2,3,4,nil,5]
        let root = TreeNode.deserialize(data)
        
        let result = BoundaryOfBinaryTree().boundaryOfBinaryTree(root)
        
        XCTAssertEqual(result, [1,5,4,2])
    }
}
