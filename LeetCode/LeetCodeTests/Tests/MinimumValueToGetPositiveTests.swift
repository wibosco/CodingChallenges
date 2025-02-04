//
//  MinimumValueToGetPositiveTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 11/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class MinimumValueToGetPositiveTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [-3, 2, -3, 4, 2]
        
        let result = MinimumValueToGetPositive().minStartValue(nums)
        
        XCTAssertEqual(result, 5)
    }
    
    func test_B() {
        let nums = [1, 2]
        
        let result = MinimumValueToGetPositive().minStartValue(nums)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_C() {
        let nums = [1, -2, -3]
        
        let result = MinimumValueToGetPositive().minStartValue(nums)
        
        XCTAssertEqual(result, 5)
    }
}
