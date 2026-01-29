// Created 22/11/2021.

import XCTest

@testable import LeetCode

final class BinaryTreeLevelOrderTraversalTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [3, 9, 20, nil, nil, 15, 7]
        
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreeLevelOrderTraversal().levelOrder(root)
        
        XCTAssertEqual(result, [[3], [9, 20], [15, 7]])
    }
    
    func test_B() {
        let data = [1]
        
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreeLevelOrderTraversal().levelOrder(root)
        
        XCTAssertEqual(result, [[1]])
    }
                                   
    func test_C() {
        let data = [Int]()
        
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreeLevelOrderTraversal().levelOrder(root)
        
        XCTAssertEqual(result, [])
    }
    
    func test_D() {
        let data = [1, 2, 3, 4, nil, nil, 5]
        
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreeLevelOrderTraversal().levelOrder(root)
        
        XCTAssertEqual(result, [[1], [2, 3], [4, 5]])
    }
}
