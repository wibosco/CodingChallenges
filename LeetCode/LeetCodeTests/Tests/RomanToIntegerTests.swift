// Created 08/11/2021.

import XCTest

@testable import LeetCode

final class RomanToIntegerTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let s = "III"
        
        let result = RomanToInteger().romanToInt(s)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_B() {
        let s = "IV"
        
        let result = RomanToInteger().romanToInt(s)
        
        XCTAssertEqual(result, 4)
    }
    
    func test_C() {
        let s = "IX"
        
        let result = RomanToInteger().romanToInt(s)
        
        XCTAssertEqual(result, 9)
    }
    
    func test_D() {
        let s = "LVIII"
        
        let result = RomanToInteger().romanToInt(s)
        
        XCTAssertEqual(result, 58)
    }
    
    func test_E() {
        let s = "MCMXCIV"
        
        let result = RomanToInteger().romanToInt(s)
        
        XCTAssertEqual(result, 1994)
    }
}
