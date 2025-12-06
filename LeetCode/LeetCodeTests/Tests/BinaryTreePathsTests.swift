// Created 31/03/2023.


import XCTest

@testable import LeetCode

final class BinaryTreePathsTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [1, 2, 3, nil, 5]
        
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreePaths().binaryTreePaths(root)
        
        XCTAssertEqual(result, ["1->2->5", "1->3"])
    }
    
    func test_B() {
        let data = [1]
        
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreePaths().binaryTreePaths(root)
        
        XCTAssertEqual(result, ["1"])
    }
    
    func test_C() {
        let data = [1, 2, 3]
        
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreePaths().binaryTreePaths(root)
        
        XCTAssertEqual(result, ["1->2", "1->3"])
    }
    
    func test_D() {
        let data = [1, 2, nil, 3]
        
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreePaths().binaryTreePaths(root)
        
        XCTAssertEqual(result, ["1->2->3"])
    }
}
