// Created 03/05/2025.

import Testing

@testable import LeetCode

struct RansomNoteTests {
    
    // MARK: - Tests
    
    @Test
    func test_A() {
        let ransomNote = "a"
        let magazine = "b"
            
        let result = RansomNote().canConstruct(ransomNote, magazine)
        
        #expect(result == false)
    }
    
    @Test
    func test_B() {
        let ransomNote = "aa"
        let magazine = "ab"
            
        let result = RansomNote().canConstruct(ransomNote, magazine)
        
        #expect(result == false)
    }
    
    @Test
    func test_C() {
        let ransomNote = "aa"
        let magazine = "aab"
            
        let result = RansomNote().canConstruct(ransomNote, magazine)
        
        #expect(result == true)
    }
}
