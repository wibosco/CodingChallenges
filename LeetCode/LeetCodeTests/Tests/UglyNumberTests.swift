// Created 20/01/2022.


import XCTest

@testable import LeetCode

final class UglyNumberTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let n = 6
        
        let result = UglyNumber().isUgly(n)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let n = 1
        
        let result = UglyNumber().isUgly(n)
        
        XCTAssertTrue(result)
    }
    
    func test_C() {
        let n = 14
        
        let result = UglyNumber().isUgly(n)
        
        XCTAssertFalse(result)
    }
}
