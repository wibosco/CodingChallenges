// Created 11/05/2025.

import Testing

@testable import LeetCode

struct MakeTheStringGreatTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let s = "leEeetcode"
        
        let result = MakeTheStringGreat().makeGood(s)
        
        #expect(result == "leetcode")
    }
    
    @Test
    func test_B() {
        let s = "abBAcC"
        
        let result = MakeTheStringGreat().makeGood(s)
        
        #expect(result == "")
    }
    
    @Test
    func test_C() {
        let s = "s"
        
        let result = MakeTheStringGreat().makeGood(s)
        
        #expect(result == "s")
    }
}
