// Created 16/01/2022.

import XCTest

@testable import LeetCode

final class LowestCommonAncestorBinaryTreeIITests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [3, 5, 1, 6, 2, 0, 8, nil, nil, 7, 4]
        
        let root = TreeNode.deserialize(data)
        let p = TreeNode(5)
        let q = TreeNode(1)
        
        let result = LowestCommonAncestorBinaryTreeII().lowestCommonAncestor(root, p, q)
        
        XCTAssertEqual(result?.val, 3)
    }
    
    func test_B() {
        let data = [3, 5, 1, 6, 2, 0, 8, nil, nil, 7, 4]
        
        let root = TreeNode.deserialize(data)
        let p = TreeNode(5)
        let q = TreeNode(4)
        
        let result = LowestCommonAncestorBinaryTreeII().lowestCommonAncestor(root, p, q)
        
        XCTAssertEqual(result?.val, 5)
    }
    
    func test_C() {
        let data = [3, 5, 1, 6, 2, 0, 8, nil, nil, 7, 4]
        
        let root = TreeNode.deserialize(data)
        let p = TreeNode(5)
        let q = TreeNode(10)
        
        let result = LowestCommonAncestorBinaryTreeII().lowestCommonAncestor(root, p, q)
        
        XCTAssertNil(result)
    }
}
