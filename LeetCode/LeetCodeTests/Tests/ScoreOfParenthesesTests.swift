// Created 13/05/2025.

import Testing

@testable import LeetCode

struct ScoreOfParenthesesTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let s = "()"
        
        let result = ScoreOfParentheses().scoreOfParentheses(s)
        
        #expect(result == 1)
    }
    
    @Test
    func test_B() {
        let s = "(())"
        
        let result = ScoreOfParentheses().scoreOfParentheses(s)
        
        #expect(result == 2)
    }
    
    @Test
    func test_C() {
        let s = "()()"
        
        let result = ScoreOfParentheses().scoreOfParentheses(s)
        
        #expect(result == 2)
    }
}
