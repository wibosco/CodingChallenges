// Created 06/12/2025.

import Testing

@testable import LeetCode

struct RepeatedSubstringPatternTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let s = "abab"
        
        let result = RepeatedSubstringPattern().repeatedSubstringPattern(s)
        
        #expect(result == true)
    }
    
    @Test
    func test_B() {
        let s = "aba"
        
        let result = RepeatedSubstringPattern().repeatedSubstringPattern(s)
        
        #expect(result == false)
    }
    
    @Test
    func test_C() {
        let s = "abcabcabcabc"
        
        let result = RepeatedSubstringPattern().repeatedSubstringPattern(s)
        
        #expect(result == true)
    }
    
    @Test
    func test_D() {
        let s = "a"
        
        let result = RepeatedSubstringPattern().repeatedSubstringPattern(s)
        
        #expect(result == false)
    }
    
    @Test
    func test_E() {
        let s = "ababab"
        
        let result = RepeatedSubstringPattern().repeatedSubstringPattern(s)
        
        #expect(result == true)
    }
}
