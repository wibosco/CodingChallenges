//
//  CheckIfStringIsAPrefixOfArrayTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 01/09/2024.
//

import XCTest

@testable import LeetCode

final class CheckIfStringIsAPrefixOfArrayTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let s = "iloveleetcode"
        let words = ["i","love","leetcode","apples"]
            
        let result = CheckIfStringIsAPrefixOfArray().isPrefixString(s, words)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let s = "iloveleetcode"
        let words = ["apples","i","love","leetcode"]
            
        let result = CheckIfStringIsAPrefixOfArray().isPrefixString(s, words)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let s = "a"
        let words = ["aa","aaaa","banana"]
            
        let result = CheckIfStringIsAPrefixOfArray().isPrefixString(s, words)
        
        XCTAssertFalse(result)
    }
}
