// Created 23/12/2021.

import XCTest

@testable import LeetCode

final class AddStringsTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let num1 = "11"
        let num2 = "123"
        
        let result = AddStrings().addStrings(num1, num2)
        
        XCTAssertEqual(result, "134")
    }
    
    func test_B() {
        let num1 = "456"
        let num2 = "77"
        
        let result = AddStrings().addStrings(num1, num2)
        
        XCTAssertEqual(result, "533")
    }
    
    func test_C() {
        let num1 = "0"
        let num2 = "0"
        
        let result = AddStrings().addStrings(num1, num2)
        
        XCTAssertEqual(result, "0")
    }
    
    func test_D() {
        let num1 = "925101087184894"
        let num2 = "3896737933784656127"
        
        let result = AddStrings().addStrings(num1, num2)
        
        XCTAssertEqual(result, "3897663034871841021")
    }
}
