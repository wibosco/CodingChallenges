//
//  NumberOfDaysBetweenTwoDatesTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 15/04/2022.
//

import XCTest

@testable import LeetCode

class NumberOfDaysBetweenTwoDatesTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let date1 = "2019-06-29"
        let date2 = "2019-06-30"
        
        let days = NumberOfDaysBetweenTwoDates.daysBetweenDates(date1, date2)
        
        XCTAssertEqual(days, 1)
    }
    
    func test_B() {
        let date1 = "2020-01-15"
        let date2 = "2019-12-31"
        
        let days = NumberOfDaysBetweenTwoDates.daysBetweenDates(date1, date2)
        
        XCTAssertEqual(days, 15)
    }
    
    func test_C() {
        let date1 = "1971-06-29"
        let date2 = "2010-09-23"
        
        let days = NumberOfDaysBetweenTwoDates.daysBetweenDates(date1, date2)
        
        XCTAssertEqual(days, 14331)
    }
}
