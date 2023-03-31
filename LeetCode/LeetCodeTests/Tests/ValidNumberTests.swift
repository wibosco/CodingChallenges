//
//  ValidNumberTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 12/04/2022.
//

import XCTest

@testable import LeetCode

final class ValidNumberTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let s = "0"
        
        let isValid = ValidNumber.isNumber(s)
        
        XCTAssertTrue(isValid)
    }
    
    func test_B() {
        let s = "e"
        
        let isValid = ValidNumber.isNumber(s)
        
        XCTAssertFalse(isValid)
    }
    
    func test_C() {
        let s = "."
        
        let isValid = ValidNumber.isNumber(s)
        
        XCTAssertFalse(isValid)
    }
    
    func test_D() {
        let s = "2.0e6"
        
        let isValid = ValidNumber.isNumber(s)
        
        XCTAssertTrue(isValid)
    }
    
    func test_E() {
        let s = "2.0E6"
        
        let isValid = ValidNumber.isNumber(s)
        
        XCTAssertTrue(isValid)
    }
    
    func test_F() {
        let s = "G2.0E6"
        
        let isValid = ValidNumber.isNumber(s)
        
        XCTAssertFalse(isValid)
    }
    
    func test_G() {
        let s = "2E6.9"
        
        let isValid = ValidNumber.isNumber(s)
        
        XCTAssertFalse(isValid)
    }
    
    func test_H() {
        let s = "2Ee6"
        
        let isValid = ValidNumber.isNumber(s)
        
        XCTAssertFalse(isValid)
    }
    
    func test_I() {
        let s = "-2E6"
        
        let isValid = ValidNumber.isNumber(s)
        
        XCTAssertTrue(isValid)
    }
    
    func test_J() {
        let s = "+2E6"
        
        let isValid = ValidNumber.isNumber(s)
        
        XCTAssertTrue(isValid)
    }
    
    func test_K() {
        let s = "2E-6"
        
        let isValid = ValidNumber.isNumber(s)
        
        XCTAssertTrue(isValid)
    }
    
    func test_L() {
        let s = "2E+6"
        
        let isValid = ValidNumber.isNumber(s)
        
        XCTAssertTrue(isValid)
    }
    
    func test_M() {
        let s = "2E++6"
        
        let isValid = ValidNumber.isNumber(s)
        
        XCTAssertFalse(isValid)
    }
    
    func test_N() {
        let s = "--2E6"
        
        let isValid = ValidNumber.isNumber(s)
        
        XCTAssertFalse(isValid)
    }
    
    func test_O() {
        let s = "E6"
        
        let isValid = ValidNumber.isNumber(s)
        
        XCTAssertFalse(isValid)
    }
    
    func test_P() {
        let s = "6."
        
        let isValid = ValidNumber.isNumber(s)
        
        XCTAssertTrue(isValid)
    }
    
    func test_Q() {
        let s = "459277e38+"
        
        let isValid = ValidNumber.isNumber(s)
        
        XCTAssertFalse(isValid)
    }
}
