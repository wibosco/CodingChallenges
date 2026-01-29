// Created 16/11/2023.

import XCTest

@testable import LeetCode

final class BinaryTreePruningTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [1,nil,0,0,1]
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreePruning().pruneTree(root)
        let values = TreeNode.serialize(result)
        
        XCTAssertEqual(values, [1,nil,0,nil,1])
    }
    
    func test_B() {
        let data = [1,0,1,0,0,0,1]
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreePruning().pruneTree(root)
        let values = TreeNode.serialize(result)
        
        XCTAssertEqual(values, [1,nil,1,nil,1])
    }
    
    func test_C() {
        let data = [1,1,0,1,1,0,1,0]
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreePruning().pruneTree(root)
        let values = TreeNode.serialize(result)
        
        XCTAssertEqual(values, [1,1,0,1,1,nil,1])
    }
    
    func test_D() {
        let data = [0,0,0]
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreePruning().pruneTree(root)
        let values = TreeNode.serialize(result)
        
        XCTAssertEqual(values, [])
    }
}
