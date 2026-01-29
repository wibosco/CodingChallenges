// Created 22/11/2021.

import XCTest

@testable import LeetCode

final class ValidateBinarySearchTreeTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [2, 1, 3]
        
        let root = TreeNode.deserialize(data)
        
        let result = ValidateBinarySearchTree().isValidBST(root)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let data = [5, 1, 4, nil, nil, 3, 6]
        
        let root = TreeNode.deserialize(data)
        
        let result = ValidateBinarySearchTree().isValidBST(root)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let data = [2, 2, 2]
        
        let root = TreeNode.deserialize(data)
        
        let result = ValidateBinarySearchTree().isValidBST(root)
        
        XCTAssertFalse(result)
    }
}
