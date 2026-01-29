// Created 22/11/2021.

import XCTest

@testable import LeetCode

final class BinaryTreeInorderTraversalTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let data = [1, nil, 2, 3]
        
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreeInorderTraversal().inorderTraversal(root)
        
        XCTAssertEqual(result, [1, 3, 2])
    }
    
    func test_B() {
        let data = [Int]()
        
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreeInorderTraversal().inorderTraversal(root)
        
        XCTAssertEqual(result, [Int]())
    }
    
    func test_C() {
        let data = [1]
        
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreeInorderTraversal().inorderTraversal(root)
        
        XCTAssertEqual(result, [1])
    }
    
    func test_D() {
        let data = [1, 2]
        
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreeInorderTraversal().inorderTraversal(root)
        
        XCTAssertEqual(result, [2, 1])
    }
    
    func test_E() {
        let data = [1, nil, 2]
        
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreeInorderTraversal().inorderTraversal(root)
        
        XCTAssertEqual(result, [1, 2])
    }
}
