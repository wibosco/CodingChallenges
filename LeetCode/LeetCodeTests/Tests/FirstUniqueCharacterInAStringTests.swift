// Created 14/11/2026.

import Testing

@testable import LeetCode

struct FirstUniqueCharacterInAStringTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let s = "loveleetcode"
        
        let result = FirstUniqueCharacterInAString().firstUniqChar(s)
        
        #expect(result == 2)
    }
    
    @Test
    func test_B() {
        let s = "leetcode"
        
        let result = FirstUniqueCharacterInAString().firstUniqChar(s)
        
        #expect(result == 0)
    }
    
    @Test
    func test_C() {
        let s = "aabb"
        
        let result = FirstUniqueCharacterInAString().firstUniqChar(s)
        
        #expect(result == -1)
    }
}
