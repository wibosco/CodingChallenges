// Created 11/05/2025.

import Testing

@testable import LeetCode

struct MinimumStringLengthAfterRemovingSubstringsTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let s = "ABFCACDB"
        
        let result = MinimumStringLengthAfterRemovingSubstrings().minLength(s)
        
        #expect(result == 2)
    }
    
    @Test
    func test_B() {
        let s = "ACBBD"
        
        let result = MinimumStringLengthAfterRemovingSubstrings().minLength(s)
        
        #expect(result == 5)
    }
}
