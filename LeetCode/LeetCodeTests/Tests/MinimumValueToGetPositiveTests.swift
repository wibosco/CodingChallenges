//
//  MinimumValueToGetPositiveTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 11/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

class MinimumValueToGetPositiveTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [-3, 2, -3, 4, 2]
        
        let minValue = MinimumValueToGetPositive.minStartValue(nums)
        
        XCTAssertEqual(minValue, 5)
    }
    
    func test_B() {
        let nums = [1, 2]
        
        let minValue = MinimumValueToGetPositive.minStartValue(nums)
        
        XCTAssertEqual(minValue, 1)
    }
    
    func test_C() {
        let nums = [1, -2, -3]
        
        let minValue = MinimumValueToGetPositive.minStartValue(nums)
        
        XCTAssertEqual(minValue, 5)
    }
}
