// Created 10/11/2021.


import XCTest

@testable import LeetCode

final class GenerateParenthesesTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let n = 3
        
        let result = GenerateParentheses().generateParenthesis(n)
        
        XCTAssertEqual(result, ["((()))", "(()())", "(())()", "()(())", "()()()"])
    }
    
    func test_B() {
        let n = 1
        
        let result = GenerateParentheses().generateParenthesis(n)
        
        XCTAssertEqual(result, ["()"])
    }
    
}
