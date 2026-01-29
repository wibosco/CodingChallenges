// Created 26/01/2022.

import XCTest

@testable import LeetCode

final class SubtreeOfAnotherTreeTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [3, 4, 5, 1, 2]
        let subData = [4, 1, 2]
        
        let root = TreeNode.deserialize(data)
        let subRoot = TreeNode.deserialize(subData)
        
        let result = SubtreeOfAnotherTree().isSubtree(root, subRoot)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let data = [3, 4, 5, 1, 2, nil, nil, nil, nil, 0]
        let subData = [4, 1, 2]
        
        let root = TreeNode.deserialize(data)
        let subRoot = TreeNode.deserialize(subData)
        
        let result = SubtreeOfAnotherTree().isSubtree(root, subRoot)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let data = [1, 1]
        let subData = [1]
        
        let root = TreeNode.deserialize(data)
        let subRoot = TreeNode.deserialize(subData)
        
        let result = SubtreeOfAnotherTree().isSubtree(root, subRoot)
        
        XCTAssertTrue(result)
    }
    
    func test_D() {
        let data = [-1, -4, 8, -6, -2, 3, 9, nil, -5, nil, nil, 0, 7]
        let subData = [3, 0, 5848]
        
        let root = TreeNode.deserialize(data)
        let subRoot = TreeNode.deserialize(subData)
        
        let result = SubtreeOfAnotherTree().isSubtree(root, subRoot)
        
        XCTAssertFalse(result)
    }
    
    func test_E() {
        let data = [3, 4, 5, 1, 2]
        let subData = [4, 1, nil, nil, 2]
        
        let root = TreeNode.deserialize(data)
        let subRoot = TreeNode.deserialize(subData)
        
        let result = SubtreeOfAnotherTree().isSubtree(root, subRoot)
        
        XCTAssertFalse(result)
    }
}
