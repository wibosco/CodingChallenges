// Created 13/09/2023.

import XCTest

@testable import LeetCode

final class ConstructStringFromBinaryTreeTests: XCTestCase {

   
    // MARK: - Tests
    
    func test_A() {
        let data = [1, 2, 3, 4]
        let root = TreeNode.deserialize(data)
        
        let result = ConstructStringFromBinaryTree().tree2str(root)
        
        XCTAssertEqual(result, "1(2(4))(3)")
    }
    
    func test_B() {
        let data = [1, 2, 3, nil, 4]
        let root = TreeNode.deserialize(data)
        
        let result = ConstructStringFromBinaryTree().tree2str(root)
        
        XCTAssertEqual(result, "1(2()(4))(3)")
    }
}
