// Created 09/11/2023.

import XCTest

@testable import LeetCode

final class SumRootToLeafNumbersTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [1,2,3]
        let root = TreeNode.deserialize(data)
        
        let result = SumRootToLeafNumbers().sumNumbers(root)
        
        XCTAssertEqual(result, 25)
    }
    
    func test_B() {
        let data = [4,9,0,5,1]
        let root = TreeNode.deserialize(data)
        
        let result = SumRootToLeafNumbers().sumNumbers(root)
        
        XCTAssertEqual(result, 1026)
    }
    
    func test_C() {
        let data = [4]
        let root = TreeNode.deserialize(data)
        
        let result = SumRootToLeafNumbers().sumNumbers(root)
        
        XCTAssertEqual(result, 4)
    }
}
