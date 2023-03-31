//
//  ValidParenthesesTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 09/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class ValidParenthesesTests: XCTestCase {

    // MARK: - Tests

    func test_A() {
        let s = "()"
        
        let isValid = ValidParentheses.isValid(s)
        
        XCTAssertTrue(isValid)
    }
    
    func test_B() {
        let s = "()[]{}"
        
        let isValid = ValidParentheses.isValid(s)
        
        XCTAssertTrue(isValid)
    }
    
    func test_C() {
        let s = "(]"
        
        let isValid = ValidParentheses.isValid(s)
        
        XCTAssertFalse(isValid)
    }
    
    func test_D() {
        let s = "([)]"
        
        let isValid = ValidParentheses.isValid(s)
        
        XCTAssertFalse(isValid)
    }
    
    func test_E() {
        let s = "{[]}"
        
        let isValid = ValidParentheses.isValid(s)
        
        XCTAssertTrue(isValid)
    }
    
    func test_F() {
        let s = "(([]){})"
        
        let isValid = ValidParentheses.isValid(s)
        
        XCTAssertTrue(isValid)
    }
    
    func test_G() {
        let s = "){"
        
        let isValid = ValidParentheses.isValid(s)
        
        XCTAssertFalse(isValid)
    }
    
    func test_H() {
        let s = "))"
        
        let isValid = ValidParentheses.isValid(s)
        
        XCTAssertFalse(isValid)
    }
}
