// Created 23/01/2022.

import XCTest

@testable import LeetCode

final class RecoverBinarySearchTreeTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let data = [1, 3, nil, nil, 2]
        let root = TreeNode.deserialize(data)
        
        RecoverBinarySearchTree().recoverTree(root)
        
        let result = TreeNode.serialize(root)
        
        XCTAssertEqual(result, [3, 1, nil, nil, 2])
    }
    
    func test_B() {
        let data = [3, 1, 4, nil, nil, 2]
        let root = TreeNode.deserialize(data)
        
        RecoverBinarySearchTree().recoverTree(root)
        
        let result = TreeNode.serialize(root)
        
        XCTAssertEqual(result, [2, 1, 4, nil, nil, 3])
    }
}
