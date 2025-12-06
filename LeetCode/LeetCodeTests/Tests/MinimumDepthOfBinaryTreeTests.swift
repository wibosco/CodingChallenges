// Created 10/07/2023.


import XCTest

@testable import LeetCode

final class MinimumDepthOfBinaryTreeTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [3, 9, 20, nil, nil, 15, 7]
        let root = TreeNode.deserialize(data)
        
        let result = MinimumDepthOfBinaryTree().minDepth(root)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_B() {
        let data = [2, nil, 3, nil, 4, nil, 5, nil, 6]
        let root = TreeNode.deserialize(data)
        
        let result = MinimumDepthOfBinaryTree().minDepth(root)
        
        XCTAssertEqual(result, 5)
    }
}
