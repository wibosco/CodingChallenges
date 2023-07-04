//
//  StringToIntegerTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 08/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class StringToIntegerTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let s = "42"
        
        let result = StringToInteger.myAtoi(s)
        
        XCTAssertEqual(result, 42)
    }
    
    func test_B() {
        let s = "   -42"
        
        let result = StringToInteger.myAtoi(s)
        
        XCTAssertEqual(result, -42)
    }
    
    func test_C() {
        let s = "4193 with words"
        
        let result = StringToInteger.myAtoi(s)
        
        XCTAssertEqual(result, 4193)
    }
    
    func test_D() {
        let s = "words and 987"
        
        let result = StringToInteger.myAtoi(s)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_E() {
        let s = "-91283472332"
        
        let result = StringToInteger.myAtoi(s)
        
        XCTAssertEqual(result, -2147483648)
    }
    
    func test_F() {
        let s = "91283472332"
        
        let result = StringToInteger.myAtoi(s)
        
        XCTAssertEqual(result, 2147483647)
    }
    
    func test_G() {
        let s = "+-12"
        
        let result = StringToInteger.myAtoi(s)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_H() {
        let s = "20000000000000000000"
        
        let result = StringToInteger.myAtoi(s)
        
        XCTAssertEqual(result, 2147483647)
    }
    
    func test_I() {
        let s = "2147483648"
        
        let result = StringToInteger.myAtoi(s)
        
        XCTAssertEqual(result, 2147483647)
    }
    
    func test_J() {
        let s = "  +  413"
        
        let result = StringToInteger.myAtoi(s)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_K() {
        let s = "-2147483649"
        
        let result = StringToInteger.myAtoi(s)
        
        XCTAssertEqual(result, -2147483648)
    }
}
