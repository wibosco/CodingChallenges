// Created 23/11/2021.

import XCTest

@testable import LeetCode

final class SymmetricTreeTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [1, 2, 2, 3, 4, 4, 3]
        
        let root = TreeNode.deserialize(data)
        
        let result = SymmetricTree().isSymmetric(root)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let data = [1, 2, 2, nil, 3, nil, 3]
        
        let root = TreeNode.deserialize(data)
        
        let result = SymmetricTree().isSymmetric(root)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let data = [1]
        
        let root = TreeNode.deserialize(data)
        
        let result = SymmetricTree().isSymmetric(root)
        
        XCTAssertTrue(result)
    }
    
    func test_D() {
        let data = [2, 3, 3, 4, 5, 5, 4, nil, nil, 8, 9, nil, nil, 9, 8]
        
        let root = TreeNode.deserialize(data)
        
        let result = SymmetricTree().isSymmetric(root)
        
        XCTAssertFalse(result)
    }
}
