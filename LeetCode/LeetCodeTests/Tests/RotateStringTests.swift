// Created 14/11/2026.

import Testing

@testable import LeetCode

struct RotateStringTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let s = "abcde"
        let goal = "cdeab"
        
        let result = RotateString().rotateString(s, goal)
        
        #expect(result == true)
    }
    
    @Test
    func test_B() {
        let s = "abcde"
        let goal = "abced"
        
        let result = RotateString().rotateString(s, goal)
        
        #expect(result == false)
    }
    
    @Test
    func test_C() {
        let s = "abc"
        let goal = "ab"
        
        let result = RotateString().rotateString(s, goal)
        
        #expect(result == false)
    }
}
