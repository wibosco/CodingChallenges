//
//  ValidWordAbbreviationTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 23/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class ValidWordAbbreviationTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let word = "internationalization"
        let abbr = "i12iz4n"
        
        let isValid = ValidWordAbbreviation.validWordAbbreviation(word, abbr)
        
        XCTAssertTrue(isValid)
    }
    
    func test_B() {
        let word = "apple"
        let abbr = "a2e"
        
        let isValid = ValidWordAbbreviation.validWordAbbreviation(word, abbr)
        
        XCTAssertFalse(isValid)
    }
    
    func test_C() {
        let word = "substitution"
        let abbr = "s10n"
        
        let isValid = ValidWordAbbreviation.validWordAbbreviation(word, abbr)
        
        XCTAssertTrue(isValid)
    }
    
    func test_D() {
        let word = "substitution"
        let abbr = "sub4u4"
        
        let isValid = ValidWordAbbreviation.validWordAbbreviation(word, abbr)
        
        XCTAssertTrue(isValid)
    }
    
    func test_E() {
        let word = "substitution"
        let abbr = "12"
        
        let isValid = ValidWordAbbreviation.validWordAbbreviation(word, abbr)
        
        XCTAssertTrue(isValid)
    }
    
    func test_F() {
        let word = "substitution"
        let abbr = "su3i1u2on"
        
        let isValid = ValidWordAbbreviation.validWordAbbreviation(word, abbr)
        
        XCTAssertTrue(isValid)
    }
    
    func test_G() {
        let word = "substitution"
        let abbr = "substitution"
        
        let isValid = ValidWordAbbreviation.validWordAbbreviation(word, abbr)
        
        XCTAssertTrue(isValid)
    }
    
    func test_H() {
        let word = "substitution"
        let abbr = "s55n"
        
        let isValid = ValidWordAbbreviation.validWordAbbreviation(word, abbr)
        
        XCTAssertFalse(isValid)
    }
    
    func test_I() {
        let word = "substitution"
        let abbr = "s010n"
        
        let isValid = ValidWordAbbreviation.validWordAbbreviation(word, abbr)
        
        XCTAssertFalse(isValid)
    }
    
    func test_J() {
        let word = "substitution"
        let abbr = "s0ubstitution"
        
        let isValid = ValidWordAbbreviation.validWordAbbreviation(word, abbr)
        
        XCTAssertFalse(isValid)
    }
    
    func test_K() {
        let word = "word"
        let abbr = "3e"
        
        let isValid = ValidWordAbbreviation.validWordAbbreviation(word, abbr)
        
        XCTAssertFalse(isValid)
    }
    
    func test_L() {
        let word = "hi"
        let abbr = "2i"
        
        let isValid = ValidWordAbbreviation.validWordAbbreviation(word, abbr)
        
        XCTAssertFalse(isValid)
    }
    
    func test_M() {
        let word = "hi"
        let abbr = "1"
        
        let isValid = ValidWordAbbreviation.validWordAbbreviation(word, abbr)
        
        XCTAssertFalse(isValid)
    }
}
