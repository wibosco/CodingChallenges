// Created 09/12/2021.

import XCTest

@testable import LeetCode

final class BinaryTreeRightSideViewTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [1, 2, 3, nil, 5, nil, 4]
        
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreeRightSideView().rightSideView(root)
        
        XCTAssertEqual(result, [1, 3, 4])
    }
    
    func test_B() {
        let data = [1, nil, 3]
        
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreeRightSideView().rightSideView(root)
        
        XCTAssertEqual(result, [1, 3])
    }
    
    func test_C() {
        let data = [Int]()
        
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreeRightSideView().rightSideView(root)
        
        XCTAssertEqual(result, [])
    }

}
