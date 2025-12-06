// Created 28/01/2022.


import XCTest

@testable import LeetCode

final class KthSmallestElementInBinarySearchTreeTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [3, 1, 4, nil, 2]
        let root = TreeNode.deserialize(data)
        let k = 1
        
        let result = KthSmallestElementInBinarySearchTree().kthSmallest(root, k)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_B() {
        let data = [5, 3, 6, 2, 4, nil, nil, 1]
        let root = TreeNode.deserialize(data)
        let k = 3
        
        let result = KthSmallestElementInBinarySearchTree().kthSmallest(root, k)
        
        XCTAssertEqual(result, 3)
    }
}
