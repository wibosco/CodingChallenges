//
//  WordBreakTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 24/04/2023.
//

import XCTest

@testable import LeetCode

final class WordBreakTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let s = "leetcode"
        let wordDict = ["leet", "code"]
        
        let result = WordBreak().wordBreak(s, wordDict)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let s = "applepenapple"
        let wordDict = ["apple", "pen"]
        
        let result = WordBreak().wordBreak(s, wordDict)
        
        XCTAssertTrue(result)
    }
    
    func test_C() {
        let s = "catsandog"
        let wordDict = ["cats", "dog", "sand", "and", "cat"]
        
        let result = WordBreak().wordBreak(s, wordDict)
        
        XCTAssertFalse(result)
    }
}
