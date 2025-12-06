// Created 23/12/2021.


import XCTest

@testable import LeetCode

final class ValidWordAbbreviationTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let word = "internationalization"
        let abbr = "i12iz4n"
        
        let result = ValidWordAbbreviation().validWordAbbreviation(word, abbr)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let word = "apple"
        let abbr = "a2e"
        
        let result = ValidWordAbbreviation().validWordAbbreviation(word, abbr)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let word = "substitution"
        let abbr = "s10n"
        
        let result = ValidWordAbbreviation().validWordAbbreviation(word, abbr)
        
        XCTAssertTrue(result)
    }
    
    func test_D() {
        let word = "substitution"
        let abbr = "sub4u4"
        
        let result = ValidWordAbbreviation().validWordAbbreviation(word, abbr)
        
        XCTAssertTrue(result)
    }
    
    func test_E() {
        let word = "substitution"
        let abbr = "12"
        
        let result = ValidWordAbbreviation().validWordAbbreviation(word, abbr)
        
        XCTAssertTrue(result)
    }
    
    func test_F() {
        let word = "substitution"
        let abbr = "su3i1u2on"
        
        let result = ValidWordAbbreviation().validWordAbbreviation(word, abbr)
        
        XCTAssertTrue(result)
    }
    
    func test_G() {
        let word = "substitution"
        let abbr = "substitution"
        
        let result = ValidWordAbbreviation().validWordAbbreviation(word, abbr)
        
        XCTAssertTrue(result)
    }
    
    func test_H() {
        let word = "substitution"
        let abbr = "s55n"
        
        let result = ValidWordAbbreviation().validWordAbbreviation(word, abbr)
        
        XCTAssertFalse(result)
    }
    
    func test_I() {
        let word = "substitution"
        let abbr = "s010n"
        
        let result = ValidWordAbbreviation().validWordAbbreviation(word, abbr)
        
        XCTAssertFalse(result)
    }
    
    func test_J() {
        let word = "substitution"
        let abbr = "s0ubstitution"
        
        let result = ValidWordAbbreviation().validWordAbbreviation(word, abbr)
        
        XCTAssertFalse(result)
    }
    
    func test_K() {
        let word = "word"
        let abbr = "3e"
        
        let result = ValidWordAbbreviation().validWordAbbreviation(word, abbr)
        
        XCTAssertFalse(result)
    }
    
    func test_L() {
        let word = "hi"
        let abbr = "2i"
        
        let result = ValidWordAbbreviation().validWordAbbreviation(word, abbr)
        
        XCTAssertFalse(result)
    }
    
    func test_M() {
        let word = "hi"
        let abbr = "1"
        
        let result = ValidWordAbbreviation().validWordAbbreviation(word, abbr)
        
        XCTAssertFalse(result)
    }
}
