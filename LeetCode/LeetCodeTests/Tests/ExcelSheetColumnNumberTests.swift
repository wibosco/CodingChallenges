// Created 22/02/2022.

import XCTest

@testable import LeetCode

final class ExcelSheetColumnNumberTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let columnTitle = "A"
        
        let result = ExcelSheetColumnNumber().titleToNumber(columnTitle)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_B() {
        let columnTitle = "AB"
        
        let result = ExcelSheetColumnNumber().titleToNumber(columnTitle)
        
        XCTAssertEqual(result, 28)
    }
    
    func test_C() {
        let columnTitle = "ZY"
        
        let result = ExcelSheetColumnNumber().titleToNumber(columnTitle)
        
        XCTAssertEqual(result, 701)
    }
}
