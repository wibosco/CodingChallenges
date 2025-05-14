// Created 13/05/2025.

import Testing

@testable import LeetCode

struct ConstructSmallestNumberFromDIStringTest {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let pattern = "IIIDIDDD"
        
        let result = ConstructSmallestNumberFromDIString().smallestNumber(pattern)
        
        #expect(result == "123549876")
    }
    
    @Test
    func test_B() {
        let pattern = "DDD"
        
        let result = ConstructSmallestNumberFromDIString().smallestNumber(pattern)
        
        #expect(result == "4321")
    }
}
