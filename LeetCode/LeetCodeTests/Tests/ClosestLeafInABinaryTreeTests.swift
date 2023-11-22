//
//  ClosestLeafInABinaryTreeTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 22/11/2023.
//

import XCTest

@testable import LeetCode

final class ClosestLeafInABinaryTreeTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let k = 1
        let data = [1,3,2]
        let root = TreeNode.deserialize(data)
        
        let result = ClosestLeafInABinaryTree.findClosestLeaf(root, k)
        
        XCTAssertEqual(result, 3) //could also be 2
    }
    
    func test_B() {
        let k = 1
        let data = [1]
        let root = TreeNode.deserialize(data)
        
        let result = ClosestLeafInABinaryTree.findClosestLeaf(root, k)
        
        XCTAssertEqual(result, 1)
    }

    func test_C() {
        let k = 2
        let data = [1,2,3,4,nil,nil,nil,5,nil,6]
        let root = TreeNode.deserialize(data)
        
        let result = ClosestLeafInABinaryTree.findClosestLeaf(root, k)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_D() {
        let k = 7
        let data = [1,2,3,nil,nil,4,5,6,nil,nil,7,8,9,10]
        let root = TreeNode.deserialize(data)
        
        let result = ClosestLeafInABinaryTree.findClosestLeaf(root, k)
        
        XCTAssertEqual(result, 10)
    }
    
    func test_E() {
        let k = 4
        let data = [1,2,3,nil,nil,4,5,6,nil,nil,7,8,9,10]
        let root = TreeNode.deserialize(data)
        
        let result = ClosestLeafInABinaryTree.findClosestLeaf(root, k)
        
        XCTAssertEqual(result, 8) //could also be 9
    }
    
    func test_F() {
        let k = 1
        let data = [1,2]
        let root = TreeNode.deserialize(data)
        
        let result = ClosestLeafInABinaryTree.findClosestLeaf(root, k)
        
        XCTAssertEqual(result, 2)
    }
}
