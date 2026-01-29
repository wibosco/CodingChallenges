// Created 17/12/2021.

import XCTest

@testable import LeetCode

final class RangeSumOfBSTTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [10, 5, 15, 3, 7, nil, 18]
        let root = TreeNode.deserialize(data)
        let low = 7
        let high = 15
        
        let result = RangeSumOfBST().rangeSumBST(root, low, high)
        
        XCTAssertEqual(result, 32)
    }
    
    func test_B() {
        let data = [10, 5, 15, 3, 7, 13, 18, 1, nil, 6]
        let root = TreeNode.deserialize(data)
        let low = 6
        let high = 10
        
        let result = RangeSumOfBST().rangeSumBST(root, low, high)
        
        XCTAssertEqual(result, 23)
    }

}
