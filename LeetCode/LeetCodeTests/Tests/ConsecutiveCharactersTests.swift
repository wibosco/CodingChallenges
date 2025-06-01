// Created 01/06/2025.

import Testing

@testable import LeetCode

struct ConsecutiveCharactersTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let s = "leetcode"
        
        let result = ConsecutiveCharacters().maxPower(s)
        
        #expect(result == 2)
    }
    
    @Test
    func test_B() {
        let s = "abbcccddddeeeeedcba"
        
        let result = ConsecutiveCharacters().maxPower(s)
        
        #expect(result == 5)
    }
}
