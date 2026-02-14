// Created 14/02/2026.

import Testing

@testable import LeetCode

struct MinimumDeletionsToMakeStringBalancedTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let s = "aababbab"
        
        let result = MinimumDeletionsToMakeStringBalanced().minimumDeletions(s)
        
        #expect(result == 2)
    }
    
    @Test
    func test_B() {
        let s = "bbaaaaabb"
        
        let result = MinimumDeletionsToMakeStringBalanced().minimumDeletions(s)
        
        #expect(result == 2)
    }
    
    @Test
    func test_C() {
        let s = "ababaaaabbbbbaaababbbbbbaaabbaababbabbbbaabbbbaabbabbabaabbbababaa"
        
        let result = MinimumDeletionsToMakeStringBalanced().minimumDeletions(s)
        
        #expect(result == 25)
    }
}
