// Created 30/12/2021.

import XCTest

@testable import LeetCode

final class NestedListWeightSumTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = "[[1,1],2,[1,1]]"
        let nestedList = NestedInteger.deserialize(data)
        
        let result = NestedListWeightSum().depthSum([nestedList])
        
        XCTAssertEqual(result, 10)
    }
    
    func test_B() {
        let data = "[1,[4,[6]]]"
        let nestedList = NestedInteger.deserialize(data)
        
        let result = NestedListWeightSum().depthSum([nestedList])
        
        XCTAssertEqual(result, 27)
    }
}
