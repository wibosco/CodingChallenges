//
//  GenerateParenthesesTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 10/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

class GenerateParenthesesTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let n = 3
        
        let combinations = GenerateParentheses.generateParenthesis(n)
        
        XCTAssertEqual(combinations, ["((()))", "(()())", "(())()", "()(())", "()()()"])
    }
    
    func test_B() {
        let n = 1
        
        let combinations = GenerateParentheses.generateParenthesis(n)
        
        XCTAssertEqual(combinations, ["()"])
    }
    
}
