//
//  StringToIntegerTests.swift
//  CodingChallengesTests
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
        
        let int = StringToInteger.myAtoi(s)
        
        XCTAssertEqual(int, 42)
    }
    
    func test_B() {
        let s = "   -42"
        
        let int = StringToInteger.myAtoi(s)
        
        XCTAssertEqual(int, -42)
    }
    
    func test_C() {
        let s = "4193 with words"
        
        let int = StringToInteger.myAtoi(s)
        
        XCTAssertEqual(int, 4193)
    }
    
    func test_D() {
        let s = "words and 987"
        
        let int = StringToInteger.myAtoi(s)
        
        XCTAssertEqual(int, 0)
    }
    
    func test_E() {
        let s = "-91283472332"
        
        let int = StringToInteger.myAtoi(s)
        
        XCTAssertEqual(int, -2147483648)
    }
    
    func test_F() {
        let s = "91283472332"
        
        let int = StringToInteger.myAtoi(s)
        
        XCTAssertEqual(int, 2147483647)
    }
    
    func test_G() {
        let s = "+-12"
        
        let int = StringToInteger.myAtoi(s)
        
        XCTAssertEqual(int, 0)
    }
    
    func test_H() {
        let s = "20000000000000000000"
        
        let int = StringToInteger.myAtoi(s)
        
        XCTAssertEqual(int, 2147483647)
    }
    
    func test_I() {
        let s = "2147483648"
        
        let int = StringToInteger.myAtoi(s)
        
        XCTAssertEqual(int, 2147483647)
    }
    
    func test_J() {
        let s = "  +  413"
        
        let int = StringToInteger.myAtoi(s)
        
        XCTAssertEqual(int, 0)
    }
    
    func test_K() {
        let s = "-2147483649"
        
        let int = StringToInteger.myAtoi(s)
        
        XCTAssertEqual(int, -2147483648)
    }
}
