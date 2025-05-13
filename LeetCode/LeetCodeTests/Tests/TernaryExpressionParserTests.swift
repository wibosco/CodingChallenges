// Created 13/05/2025.

import Testing

@testable import LeetCode

struct TernaryExpressionParserTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let expression = "T?2:3"
        
        let result = TernaryExpressionParser().parseTernary(expression)
        
        #expect(result == "2")
    }
    
    @Test
    func test_B() {
        let expression = "F?1:T?4:5"
        
        let result = TernaryExpressionParser().parseTernary(expression)
        
        #expect(result == "4")
    }
    
    @Test
    func test_C() {
        let expression = "T?T?F:5:3"
        
        let result = TernaryExpressionParser().parseTernary(expression)
        
        #expect(result == "F")
    }
}
