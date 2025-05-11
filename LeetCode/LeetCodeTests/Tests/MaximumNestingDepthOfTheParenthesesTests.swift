// Created 11/05/2025.

import Testing

@testable import LeetCode

struct MaximumNestingDepthOfTheParenthesesTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let s = "(1+(2*3)+((8)/4))+1"
            
        let result = MaximumNestingDepthOfTheParentheses().maxDepth(s)
        
        #expect(result == 3)
    }
    
    @Test
    func test_B() {
        let s = "(1)+((2))+(((3)))"
            
        let result = MaximumNestingDepthOfTheParentheses().maxDepth(s)
        
        #expect(result == 3)
    }
    
    @Test
    func test_C() {
        let s = "()(())((()()))"
            
        let result = MaximumNestingDepthOfTheParentheses().maxDepth(s)
        
        #expect(result == 3)
    }
}
