// Created 11/05/2025.

import Testing

@testable import LeetCode

struct RemoveOutermostParenthesesTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let s = "(()())(())"
        
        let result = RemoveOutermostParentheses().removeOuterParentheses(s)
        
        #expect(result == "()()()")
    }
    
    @Test
    func test_B() {
        let s = "(()())(())(()(()))"
        
        let result = RemoveOutermostParentheses().removeOuterParentheses(s)
        
        #expect(result == "()()()()(())")
    }
    
    @Test
    func test_C() {
        let s = "()()"
        
        let result = RemoveOutermostParentheses().removeOuterParentheses(s)
        
        #expect(result == "")
    }
}
