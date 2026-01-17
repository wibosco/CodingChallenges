// Created 17/01/2026.

import Testing

@testable import LeetCode

struct MaximumProductOfWordLengthsTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let words = ["abcw","baz","foo","bar","xtfn","abcdef"]
        
        let result = MaximumProductOfWordLengths().maxProduct(words)
        
        #expect(result == 16)
    }
    
    @Test
    func test_B() {
        let words = ["a","ab","abc","d","cd","bcd","abcd"]
        
        let result = MaximumProductOfWordLengths().maxProduct(words)
        
        #expect(result == 4)
    }
    
    @Test
    func test_C() {
        let words = ["a","aa","aaa","aaaa"]
        
        let result = MaximumProductOfWordLengths().maxProduct(words)
        
        #expect(result == 0)
    }
    
    @Test
    func test_D() {
        let words = ["eae","ea","aaf","bda","fcf","dc","ac","ce","cefde","dabae"]
        
        let result = MaximumProductOfWordLengths().maxProduct(words)
        
        #expect(result == 15)
    }
}
