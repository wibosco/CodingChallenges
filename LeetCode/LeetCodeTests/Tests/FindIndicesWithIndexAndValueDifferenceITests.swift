//
//  FindIndicesWithIndexAndValueDifferenceITests.swift
//  LeetCodeTests
//
//  Created by William Boles on 11/06/2024.
//

import XCTest

@testable import LeetCode

final class FindIndicesWithIndexAndValueDifferenceITests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [5,1,4,1]
        let indexDifference = 2
        let valueDifference = 4
        
        let result = FindIndicesWithIndexAndValueDifferenceI().findIndices(nums, indexDifference, valueDifference)
        
        XCTAssertEqual(result, [0,3])
    }
    
    func test_B() {
        let nums = [2,1]
        let indexDifference = 0
        let valueDifference = 0
        
        let result = FindIndicesWithIndexAndValueDifferenceI().findIndices(nums, indexDifference, valueDifference)
        
        XCTAssertEqual(result, [0,0])
    }
    
    func test_C() {
        let nums = [1,2,3]
        let indexDifference = 2
        let valueDifference = 4
        
        let result = FindIndicesWithIndexAndValueDifferenceI().findIndices(nums, indexDifference, valueDifference)
        
        XCTAssertEqual(result, [-1,-1])
    }
}
