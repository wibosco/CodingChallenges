//
//  ValidParenthesisStringTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 05/07/2023.
//

import XCTest

@testable import LeetCode

final class ValidParenthesisStringTests: XCTestCase {
    
    //MARK: - Tests
    
    func test_A() {
        let s = "()"
        
        let result = ValidParenthesisString.checkValidString(s)
        
        XCTAssertTrue(result)
    }

    func test_B() {
        let s = "(*))"
        
        let result = ValidParenthesisString.checkValidString(s)
        
        XCTAssertTrue(result)
    }
    
    func test_C() {
        let s = "(*)"
        
        let result = ValidParenthesisString.checkValidString(s)
        
        XCTAssertTrue(result)
    }
    
    func test_D() {
        let s = ")(*)"
        
        let result = ValidParenthesisString.checkValidString(s)
        
        XCTAssertFalse(result)
    }
    
    func test_E() {
        let s = "(*)))"
        
        let result = ValidParenthesisString.checkValidString(s)
        
        XCTAssertFalse(result)
    }
    
    func test_F() {
        let s = "***)))"
        
        let result = ValidParenthesisString.checkValidString(s)
        
        XCTAssertTrue(result)
    }
}
