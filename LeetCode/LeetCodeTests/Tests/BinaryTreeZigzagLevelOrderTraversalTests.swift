// Created 28/01/2022.

import XCTest

@testable import LeetCode

final class BinaryTreeZigzagLevelOrderTraversalTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [3, 9, 20, nil, nil, 15, 7]
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreeZigzagLevelOrderTraversal().zigzagLevelOrder(root)
        
        XCTAssertEqual(result, [[3], [20, 9], [15, 7]])
    }
    
    func test_B() {
        let data = [1]
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreeZigzagLevelOrderTraversal().zigzagLevelOrder(root)
        
        XCTAssertEqual(result, [[1]])
    }
    
    func test_C() {
        let data = [Int?]()
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreeZigzagLevelOrderTraversal().zigzagLevelOrder(root)
        
        XCTAssertEqual(result, [[Int]]())
    }
}
