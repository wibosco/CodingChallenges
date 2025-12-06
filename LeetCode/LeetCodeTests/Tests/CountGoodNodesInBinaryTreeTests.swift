// Created 08/05/2023.


import XCTest

@testable import LeetCode

final class CountGoodNodesInBinaryTreeTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [3, 1, 4, 3, nil, 1, 5]
        let root = TreeNode.deserialize(data)
        
        let result = CountGoodNodesInBinaryTree().goodNodes(root)
        
        XCTAssertEqual(result, 4)
    }
    
    func test_B() {
        let data = [3, 3, nil, 4, 2]
        let root = TreeNode.deserialize(data)
        
        let result = CountGoodNodesInBinaryTree().goodNodes(root)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_C() {
        let data = [1]
        let root = TreeNode.deserialize(data)
        
        let result = CountGoodNodesInBinaryTree().goodNodes(root)
        
        XCTAssertEqual(result, 1)
    }
}
