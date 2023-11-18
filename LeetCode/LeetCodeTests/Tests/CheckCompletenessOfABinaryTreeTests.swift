//
//  CheckCompletenessOfABinaryTreeTest.swift
//  LeetCodeTests
//
//  Created by William Boles on 18/11/2023.
//

import XCTest

@testable import LeetCode

final class CheckCompletenessOfABinaryTreeTest: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [1,2,3,4,5,6]
        let root = TreeNode.deserialize(data)
        
        let result = CheckCompletenessOfABinaryTree.isCompleteTree(root)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let data = [1,2,3,4,5,nil,7]
        let root = TreeNode.deserialize(data)
        
        let result = CheckCompletenessOfABinaryTree.isCompleteTree(root)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let data = [1,2,3,nil,nil,6]
        let root = TreeNode.deserialize(data)
        
        let result = CheckCompletenessOfABinaryTree.isCompleteTree(root)
        
        XCTAssertFalse(result)
    }
    
    func test_D() {
        let data = [1,2,3,5,6]
        let root = TreeNode.deserialize(data)
        
        let result = CheckCompletenessOfABinaryTree.isCompleteTree(root)
        
        XCTAssertTrue(result)
    }
    
    func test_E() {
        let data = [1,2,3,4,5,6,7,8,9,10,11,12,13,nil,nil,15]
        let root = TreeNode.deserialize(data)
        
        let result = CheckCompletenessOfABinaryTree.isCompleteTree(root)
        
        XCTAssertFalse(result)
    }
}
