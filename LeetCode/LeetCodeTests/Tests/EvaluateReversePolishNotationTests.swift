//
//  EvaluateReversePolishNotationTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 15/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class EvaluateReversePolishNotationTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let tokens = ["2", "1", "+", "3", "*"]
        
        let result = EvaluateReversePolishNotation.evalRPN(tokens)
        
        XCTAssertEqual(result, 9)
    }
    
    func test_B() {
        let tokens = ["4", "13", "5", "/", "+"]
        
        let result = EvaluateReversePolishNotation.evalRPN(tokens)
        
        XCTAssertEqual(result, 6)
    }
    
    func test_C() {
        let tokens = ["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"]
        
        let result = EvaluateReversePolishNotation.evalRPN(tokens)
        
        XCTAssertEqual(result, 22)
    }
    
    func test_D() {
        let tokens = ["18"]
        
        let result = EvaluateReversePolishNotation.evalRPN(tokens)
        
        XCTAssertEqual(result, 18)
    }
    
    func test_E() {
        let tokens = ["4", "3", "-"]
        
        let result = EvaluateReversePolishNotation.evalRPN(tokens)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_F() {
        let tokens = ["3", "11", "+", "5", "-"]
        
        let result = EvaluateReversePolishNotation.evalRPN(tokens)
        
        XCTAssertEqual(result, 9)
    }
}
