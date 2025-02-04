//
//  WordPatternTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 01/04/2023.
//

import XCTest

@testable import LeetCode

final class WordPatternTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let pattern = "abba"
        let str = "dog cat cat dog"
        
        let result = WordPattern().wordPattern(pattern, str)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let pattern = "abba"
        let str = "dog cat cat fish"
        
        let result = WordPattern().wordPattern(pattern, str)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let pattern = "aaaa"
        let str = "dog cat cat dog"
        
        let result = WordPattern().wordPattern(pattern, str)
        
        XCTAssertFalse(result)
    }
    
    func test_D() {
        let pattern = "abba"
        let str = "dog dog dog dog"
        
        let result = WordPattern().wordPattern(pattern, str)
        
        XCTAssertFalse(result)
    }
    
    func test_E() {
        let pattern = "aaa"
        let str = "aa aa aa aa"
        
        let result = WordPattern().wordPattern(pattern, str)
        
        XCTAssertFalse(result)
    }
}
