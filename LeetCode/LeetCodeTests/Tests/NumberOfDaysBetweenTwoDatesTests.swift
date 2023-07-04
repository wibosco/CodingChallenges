//
//  NumberOfDaysBetweenTwoDatesTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 15/04/2022.
//

import XCTest

@testable import LeetCode

final class NumberOfDaysBetweenTwoDatesTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let date1 = "2019-06-29"
        let date2 = "2019-06-30"
        
        let result = NumberOfDaysBetweenTwoDates.daysBetweenDates(date1, date2)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_B() {
        let date1 = "2020-01-15"
        let date2 = "2019-12-31"
        
        let result = NumberOfDaysBetweenTwoDates.daysBetweenDates(date1, date2)
        
        XCTAssertEqual(result, 15)
    }
    
    func test_C() {
        let date1 = "1971-06-29"
        let date2 = "2010-09-23"
        
        let result = NumberOfDaysBetweenTwoDates.daysBetweenDates(date1, date2)
        
        XCTAssertEqual(result, 14331)
    }
}
