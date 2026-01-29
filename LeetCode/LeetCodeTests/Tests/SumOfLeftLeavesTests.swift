// Created 09/11/2023.

import XCTest

@testable import LeetCode

final class SumOfLeftLeavesTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [3,9,20,nil,nil,15,7]
        let root = TreeNode.deserialize(data)
        
        let result = SumOfLeftLeaves().sumOfLeftLeaves(root)
        
        XCTAssertEqual(result, 24)
    }
    
    func test_B() {
        let data = [1]
        let root = TreeNode.deserialize(data)
        
        let result = SumOfLeftLeaves().sumOfLeftLeaves(root)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_C() {
        let data = [1,2,3,4,5]
        let root = TreeNode.deserialize(data)
        
        let result = SumOfLeftLeaves().sumOfLeftLeaves(root)
        
        XCTAssertEqual(result, 4)
    }
}
