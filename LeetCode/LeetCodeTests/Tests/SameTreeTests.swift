// Created 28/01/2022.

import XCTest

@testable import LeetCode

final class SameTreeTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let p = [1, 2, 3]
        let q = [1, 2, 3]
        
        let pRoot = TreeNode.deserialize(p)
        let qRoot = TreeNode.deserialize(q)
        
        let result = SameTree().isSameTree(pRoot, qRoot)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let p = [1, 2]
        let q = [1, nil, 2]
        
        let pRoot = TreeNode.deserialize(p)
        let qRoot = TreeNode.deserialize(q)
        
        let result = SameTree().isSameTree(pRoot, qRoot)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let p = [1, 2, 1]
        let q = [1, 1, 2]
        
        let pRoot = TreeNode.deserialize(p)
        let qRoot = TreeNode.deserialize(q)
        
        let result = SameTree().isSameTree(pRoot, qRoot)
        
        XCTAssertFalse(result)
    }
}
