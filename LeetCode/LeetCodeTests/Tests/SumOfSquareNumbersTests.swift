// Created 09/09/2024.

import XCTest

@testable import LeetCode

final class SumOfSquareNumbersTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let c = 5
        
        let result = SumOfSquareNumbers().judgeSquareSum(c)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let c = 3
        
        let result = SumOfSquareNumbers().judgeSquareSum(c)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let c = 2
        
        let result = SumOfSquareNumbers().judgeSquareSum(c)
        
        XCTAssertTrue(result)
    }
}
