// Created 31/03/2023.

import XCTest

@testable import LeetCode

final class AddDigitsTests: XCTestCase {

  // MARK: - Tests
    
    func test_A() {
        let num = 38
        
        let result = AddDigits().addDigits(num)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_B() {
        let num = 11
        
        let result = AddDigits().addDigits(num)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_C() {
        let num = 111
        
        let result = AddDigits().addDigits(num)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_D() {
        let num = 864
        
        let result = AddDigits().addDigits(num)
        
        XCTAssertEqual(result, 9)
    }
    
    func test_E() {
        let num = 2345
        
        let result = AddDigits().addDigits(num)
        
        XCTAssertEqual(result, 5)
    }
    
    func test_F() {
        let num = 9999
        
        let result = AddDigits().addDigits(num)
        
        XCTAssertEqual(result, 9)
    }
    
    func test_G() {
        let num = 0
        
        let result = AddDigits().addDigits(num)
        
        XCTAssertEqual(result, 0)
    }
}
