//
//  SortTransformedArrayTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 04/09/2024.
//

import XCTest

@testable import LeetCode

final class SortTransformedArrayTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [-4,-2,2,4]
        let a = 1
        let b = 3
        let c = 5
        
        let result = SortTransformedArray().sortTransformedArray(nums, a, b, c)
        
        XCTAssertEqual(result, [3,9,15,33])
    }
    
    func test_B() {
        let nums = [-4,-2,2,4]
        let a = -1
        let b = 3
        let c = 5
        
        let result = SortTransformedArray().sortTransformedArray(nums, a, b, c)
        
        XCTAssertEqual(result, [-23,-5,1,7])
    }
}
