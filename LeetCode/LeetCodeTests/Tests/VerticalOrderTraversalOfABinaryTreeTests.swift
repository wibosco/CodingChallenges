// Created 04/03/2022.

import XCTest

@testable import LeetCode

final class VerticalOrderTraversalOfABinaryTreeTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [3, 9, 20, nil, nil, 15, 7]
        let root = TreeNode.deserialize(data)
        
        let result = VerticalOrderTraversalOfABinaryTree().verticalTraversal(root)
        
        XCTAssertEqual(result, [[9], [3, 15], [20], [7]])
    }
    
    func test_B() {
        let data = [1, 2, 3, 4, 5, 6, 7]
        let root = TreeNode.deserialize(data)
        
        let result = VerticalOrderTraversalOfABinaryTree().verticalTraversal(root)
        
        XCTAssertEqual(result, [[4], [2], [1, 5, 6], [3], [7]])
    }
    
    func test_C() {
        let data = [1, 2, 3, 4, 6, 5, 7]
        let root = TreeNode.deserialize(data)
        
        let result = VerticalOrderTraversalOfABinaryTree().verticalTraversal(root)
        
        XCTAssertEqual(result, [[4], [2], [1, 5, 6], [3], [7]])
    }
}
