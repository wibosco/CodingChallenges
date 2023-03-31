//
//  ExcelSheetColumnNumberTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 22/02/2022.
//

import XCTest

@testable import LeetCode

final class ExcelSheetColumnNumberTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let columnTitle = "A"
        
        let num = ExcelSheetColumnNumber.titleToNumber(columnTitle)
        
        XCTAssertEqual(num, 1)
    }
    
    func test_B() {
        let columnTitle = "AB"
        
        let num = ExcelSheetColumnNumber.titleToNumber(columnTitle)
        
        XCTAssertEqual(num, 28)
    }
    
    func test_C() {
        let columnTitle = "ZY"
        
        let num = ExcelSheetColumnNumber.titleToNumber(columnTitle)
        
        XCTAssertEqual(num, 701)
    }
}
