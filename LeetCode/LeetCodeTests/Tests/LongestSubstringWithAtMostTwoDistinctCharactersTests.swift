// Created 01/06/2025.

import Testing

@testable import LeetCode

struct LongestSubstringWithAtMostTwoDistinctCharactersTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let s = "eceba"
        
        let result = LongestSubstringWithAtMostTwoDistinctCharacters().lengthOfLongestSubstringTwoDistinct(s)
        
        #expect(result == 3)
    }
    
    @Test
    func test_B() {
        let s = "ccaabbb"
        
        let result = LongestSubstringWithAtMostTwoDistinctCharacters().lengthOfLongestSubstringTwoDistinct(s)
        
        #expect(result == 5)
    }
}
