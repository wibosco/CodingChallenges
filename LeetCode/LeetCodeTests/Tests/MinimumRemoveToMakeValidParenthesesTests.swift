//
//  MinimumRemoveToMakeValidParenthesesTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 12/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

class MinimumRemoveToMakeValidParenthesesTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let s = "lee(t(c)o)de)"
        
        let valid = MinimumRemoveToMakeValidParentheses.minRemoveToMakeValid(s)
        
        XCTAssertEqual(valid, "lee(t(c)o)de")
    }
    
    func test_B() {
        let s = "a)b(c)d"
        
        let valid = MinimumRemoveToMakeValidParentheses.minRemoveToMakeValid(s)
        
        XCTAssertEqual(valid, "ab(c)d")
    }
    
    func test_C() {
        let s = "))(("
        
        let valid = MinimumRemoveToMakeValidParentheses.minRemoveToMakeValid(s)
        
        XCTAssertEqual(valid, "")
    }
}
