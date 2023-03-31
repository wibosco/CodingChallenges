//
//  MultiplyStringsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 24/02/2022.
//

import XCTest

@testable import LeetCode

final class MultiplyStringsTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let num1 = "2"
        let num2 = "3"
        
        let str = MultiplyStrings.multiply(num1, num2)
        
        XCTAssertEqual(str, "6")
    }
    
    func test_B() {
        let num1 = "123"
        let num2 = "456"
        
        let str = MultiplyStrings.multiply(num1, num2)
        
        XCTAssertEqual(str, "56088")
    }
    
    func test_C() {
        let num1 = "9133"
        let num2 = "0"
        
        let str = MultiplyStrings.multiply(num1, num2)
        
        XCTAssertEqual(str, "0")
    }
}
