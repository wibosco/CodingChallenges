//
//  MinimumRemoveToMakeValidParenthesesTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 12/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class MinimumRemoveToMakeValidParenthesesTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let s = "lee(t(c)o)de)"
        
        let result = MinimumRemoveToMakeValidParentheses().minRemoveToMakeValid(s)
        
        XCTAssertEqual(result, "lee(t(c)o)de")
    }
    
    func test_B() {
        let s = "a)b(c)d"
        
        let result = MinimumRemoveToMakeValidParentheses().minRemoveToMakeValid(s)
        
        XCTAssertEqual(result, "ab(c)d")
    }
    
    func test_C() {
        let s = "))(("
        
        let result = MinimumRemoveToMakeValidParentheses().minRemoveToMakeValid(s)
        
        XCTAssertEqual(result, "")
    }
}
