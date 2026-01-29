// Created 22/11/2021.

import XCTest

@testable import LeetCode

final class BinaryTreePreorderTraversalTests: XCTestCase {

    // MARK: - Tests

    func test_A() {
        let data = [1, nil, 2, 3]
        
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreePreorderTraversal().preorderTraversal(root)
        
        XCTAssertEqual(result, [1, 2, 3])
    }
    
    func test_B() {
        let data = [Int]()
        
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreePreorderTraversal().preorderTraversal(root)
        
        XCTAssertEqual(result, [Int]())
    }
    
    func test_C() {
        let data = [1]
        
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreePreorderTraversal().preorderTraversal(root)
        
        XCTAssertEqual(result, [1])
    }
    
    func test_D() {
        let data = [1, 2]
        
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreePreorderTraversal().preorderTraversal(root)
        
        XCTAssertEqual(result, [1, 2])
    }
    
    func test_E() {
        let data = [1, nil, 2]
        
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreePreorderTraversal().preorderTraversal(root)
        
        XCTAssertEqual(result, [1, 2])
    }
}
