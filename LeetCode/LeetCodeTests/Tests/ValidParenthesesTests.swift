//
//  ValidParenthesesTests.swift
//  LeetCodeTests
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
        
        let result = ValidParentheses().isValid(s)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let s = "()[]{}"
        
        let result = ValidParentheses().isValid(s)
        
        XCTAssertTrue(result)
    }
    
    func test_C() {
        let s = "(]"
        
        let result = ValidParentheses().isValid(s)
        
        XCTAssertFalse(result)
    }
    
    func test_D() {
        let s = "([)]"
        
        let result = ValidParentheses().isValid(s)
        
        XCTAssertFalse(result)
    }
    
    func test_E() {
        let s = "{[]}"
        
        let result = ValidParentheses().isValid(s)
        
        XCTAssertTrue(result)
    }
    
    func test_F() {
        let s = "(([]){})"
        
        let result = ValidParentheses().isValid(s)
        
        XCTAssertTrue(result)
    }
    
    func test_G() {
        let s = "){"
        
        let result = ValidParentheses().isValid(s)
        
        XCTAssertFalse(result)
    }
    
    func test_H() {
        let s = "))"
        
        let result = ValidParentheses().isValid(s)
        
        XCTAssertFalse(result)
    }
}
