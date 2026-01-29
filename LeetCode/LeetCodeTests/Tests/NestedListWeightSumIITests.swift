// Created 17/12/2021.

import XCTest

@testable import LeetCode

final class NestedListWeightSumIITests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = "[[1,1],2,[1,1]]"
        let nestedList = NestedInteger.deserialize(data)
        
        let result = NestedListWeightSumII().depthSumInverse([nestedList])
        
        XCTAssertEqual(result, 8)
    }
    
    func test_B() {
        let data = "[1,[4,[6]]]"
        let nestedList = NestedInteger.deserialize(data)
        
        let result = NestedListWeightSumII().depthSumInverse([nestedList])
        
        XCTAssertEqual(result, 17)
    }

}
