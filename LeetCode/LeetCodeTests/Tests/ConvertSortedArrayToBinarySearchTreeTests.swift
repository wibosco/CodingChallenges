// Created 29/01/2022.


import XCTest

@testable import LeetCode

final class ConvertSortedArrayToBinarySearchTreeTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [-10, -3, 0, 5, 9]
        
        let root = ConvertSortedArrayToBinarySearchTree().sortedArrayToBST(nums)
        
        let result = TreeNode.serialize(root)
        
        XCTAssertEqual(result, [0, -3, 9, -10, nil, 5])
    }
    
    func test_B() {
        let nums = [1, 3]
        
        let root = ConvertSortedArrayToBinarySearchTree().sortedArrayToBST(nums)
        
        let result = TreeNode.serialize(root)
        
        XCTAssertEqual(result, [3, 1])
    }
}
