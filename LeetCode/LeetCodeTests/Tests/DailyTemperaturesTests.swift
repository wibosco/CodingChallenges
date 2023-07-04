//
//  DailyTemperaturesTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 14/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class DailyTemperaturesTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let temperatures = [73, 74, 75, 71, 69, 72, 76, 73]
        
        let result = DailyTemperatures.dailyTemperatures(temperatures)
        
        XCTAssertEqual(result, [1, 1, 4, 2, 1, 1, 0, 0])
    }
    
    func test_B() {
        let temperatures = [30, 40, 50, 60]
        
        let result = DailyTemperatures.dailyTemperatures(temperatures)
        
        XCTAssertEqual(result, [1, 1, 1, 0])
    }
    
    func test_C() {
        let temperatures = [30, 60, 90]
        
        let result = DailyTemperatures.dailyTemperatures(temperatures)
        
        XCTAssertEqual(result, [1, 1, 0])
    }
}
