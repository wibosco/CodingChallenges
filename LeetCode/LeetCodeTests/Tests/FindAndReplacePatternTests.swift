// Created 05/12/2025.

import Testing

@testable import LeetCode

struct FindAndReplacePatternTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let words = ["abc","deq","mee","aqq","dkd","ccc"]
        let pattern = "abb"
            
        let result = FindAndReplacePattern().findAndReplacePattern(words, pattern)
        
        #expect(result == ["mee","aqq"])
    }
    
    @Test
    func test_B() {
        let words = ["a","b","c"]
        let pattern = "a"
            
        let result = FindAndReplacePattern().findAndReplacePattern(words, pattern)
        
        #expect(result == ["a","b","c"])
    }
    
    @Test
    func test_C() {
        let words = ["abc","cba","xyx","yxx","yyx"]
        let pattern = "abc"
            
        let result = FindAndReplacePattern().findAndReplacePattern(words, pattern)
        
        #expect(result == ["abc","cba"])
    }
}
