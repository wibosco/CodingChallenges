// Created 29/01/2022.


import XCTest

@testable import LeetCode

final class BinaryTreeLevelOrderTraversalIITests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [3, 9, 20, nil, nil, 15, 7]
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreeLevelOrderTraversalII().levelOrderBottom(root)
        
        XCTAssertEqual(result, [[15, 7], [9, 20], [3]])
    }
    
    func test_B() {
        let data = [1]
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreeLevelOrderTraversalII().levelOrderBottom(root)
        
        XCTAssertEqual(result, [[1]])
    }
    
    func test_C() {
        let data = [Int]()
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreeLevelOrderTraversalII().levelOrderBottom(root)
        
        XCTAssertEqual(result, [[Int]]())
    }
}
