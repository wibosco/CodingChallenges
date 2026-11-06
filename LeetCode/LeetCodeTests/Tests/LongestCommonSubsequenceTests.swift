// Created 06/11/2026.

import Testing

@testable import LeetCode

struct LongestCommonSubsequenceTests {
        
    // MARK: - Tests
    
    @Test
    func test_A() {
        let text1 = "abcde"
        let text2 = "ace"
        
        let result = LongestCommonSubsequence().longestCommonSubsequence(text1, text2)
        
        #expect(result == 3)
    }
    
    @Test
    func test_B() {
        let text1 = "abc"
        let text2 = "abc"
        
        let result = LongestCommonSubsequence().longestCommonSubsequence(text1, text2)
        
        #expect(result == 3)
    }
    
    @Test
    func test_C() {
        let text1 = "abc"
        let text2 = "def"
        
        let result = LongestCommonSubsequence().longestCommonSubsequence(text1, text2)
        
        #expect(result == 0)
    }
    
    @Test
    func test_F() {
        let text1 = "ezupkr"
        let text2 = "ubmrapg"
        
        let result = LongestCommonSubsequence().longestCommonSubsequence(text1, text2)
        
        #expect(result == 2)
    }
    
    @Test
    func test_E() {
        let text1 = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        let text2 = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        
        let result = LongestCommonSubsequence().longestCommonSubsequence(text1, text2)
        
        #expect(result == 210)
    }
}
